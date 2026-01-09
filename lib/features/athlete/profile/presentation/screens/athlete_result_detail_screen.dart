import 'dart:io';
import 'package:athlink/features/athlete/profile/presentation/widgets/result_full_details_tab.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/result_summary_tab.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/results_media_tab.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/features/athlete/profile/presentation/screens/athlete_results_screen.dart';

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
  final List<File> _uploadedMedia = [];
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _summaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _pickMedia() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _uploadedMedia.add(File(image.path)));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _summaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: CustomText(
          title: widget.result.competition,
          fontSize: 18, // Slightly smaller for better AppBar fitting
          textColor: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.orangeGradientStart,
          indicatorWeight: 3,
          labelColor: AppColors.orangeGradientStart,
          unselectedLabelColor: AppColors.white.withValues(alpha: 0.5),
          dividerColor: AppColors.white.withValues(
            alpha: 0.1,
          ), // Subtle divider
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'Outfit', // Assuming your project uses a specific font
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
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
          ResultFullDetailsTab(result: widget.result),
          ResultMediaTab(mediaFiles: _uploadedMedia, onUpload: _pickMedia),
          ResultSummaryTab(controller: _summaryController),
        ],
      ),
    );
  }
}
