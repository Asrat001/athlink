import 'dart:io';
import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import '../widgets/result_full_details_tab.dart';
import '../widgets/results_media_tab.dart';
import '../widgets/result_summary_tab.dart';

class AthleteResultDetailScreen extends StatefulWidget {
  final ResultData result;
  const AthleteResultDetailScreen({super.key, required this.result});

  @override
  State<AthleteResultDetailScreen> createState() =>
      _AthleteResultDetailScreenState();
}

class _AthleteResultDetailScreenState extends State<AthleteResultDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<File> _uploadedMedia;
  late TextEditingController _summaryController;
  String? _currentResultsLink;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _uploadedMedia = List.from(widget.result.media);
    _summaryController = TextEditingController(text: widget.result.summary);
    _currentResultsLink = widget.result.resultsLink;
  }

  void _saveAndExit() {
    final finalResult = widget.result.copyWith(
      media: _uploadedMedia,
      summary: _summaryController.text,
      resultsLink: _currentResultsLink,
    );
    Navigator.pop(context, finalResult);
  }

  Future<void> _pickMedia() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _uploadedMedia.add(File(image.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
            size: 20,
          ),
          onPressed: _saveAndExit,
        ),
        title: CustomText(
          title: widget.result.competition,
          fontSize: 18,
          textColor: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        bottom: TabBar(
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          controller: _tabController,
          indicatorColor: AppColors.orangeGradientStart,
          indicatorWeight: 3,

          labelColor: AppColors.orangeGradientStart,

          unselectedLabelColor: AppColors.white.withValues(alpha: 0.5),
          dividerColor: AppColors.white.withValues(alpha: 0.1),
          tabs: const [
            Tab(text: "Full results"),
            Tab(text: "Media"),
            Tab(text: "Summary"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ResultFullDetailsTab(
            result: widget.result,
            currentLink: _currentResultsLink,
            onLinkUpdated: (newLink) =>
                setState(() => _currentResultsLink = newLink),
          ),
          ResultMediaTab(
            mediaFiles: _uploadedMedia,
            onUpload: _pickMedia,
            onDelete: (index) {
              setState(() {
                _uploadedMedia.removeAt(index);
              });
            },
          ),
          ResultSummaryTab(
            controller: _summaryController,
            onSave: _saveAndExit,
          ),
        ],
      ),
    );
  }
}
