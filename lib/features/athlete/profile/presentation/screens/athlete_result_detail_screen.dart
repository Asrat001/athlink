import 'dart:io';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/competition_results_provider.dart';
import 'package:athlink/shared/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import '../widgets/result_full_details_tab.dart';
import '../widgets/results_media_tab.dart';
import '../widgets/result_summary_tab.dart';

class AthleteResultDetailScreen extends ConsumerStatefulWidget {
  final ResultData result;
  final bool isSelf;
  final String? athleteId; // Added athleteId

  const AthleteResultDetailScreen({
    super.key,
    required this.result,
    this.isSelf = true,
    this.athleteId, // Optional athleteId
  });

  @override
  ConsumerState<AthleteResultDetailScreen> createState() =>
      _AthleteResultDetailScreenState();
}

class _AthleteResultDetailScreenState
    extends ConsumerState<AthleteResultDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<File> _uploadedMedia;
  late List<File> _newlyAddedMedia; // Track only newly added files
  List<String> _mediaUrls = [];
  late TextEditingController _summaryController;
  String? _currentResultsLink;
  final ImagePicker _picker = ImagePicker();

  // Original values to detect changes
  late String _originalSummary;
  late String? _originalResultsLink;
  late List<String> _originalMediaUrls;

  @override
  void initState() {
    super.initState();
    // Log the state and ID for debugging
    logger("isSelf: ${widget.isSelf}, athleteId: ${widget.athleteId}");

    _tabController = TabController(length: 3, vsync: this);
    _uploadedMedia = List.from(widget.result.media);
    _newlyAddedMedia = []; // Initialize empty list for new files
    _mediaUrls = List.from(widget.result.mediaUrls);
    _summaryController = TextEditingController(
      text: widget.result.competitionSummary,
    );
    _currentResultsLink = widget.result.resultLink;

    // Store original values
    _originalSummary = widget.result.competitionSummary;
    _originalResultsLink = widget.result.resultLink;
    _originalMediaUrls = List.from(widget.result.mediaUrls);
  }

  bool get _hasChanges {
    if (_summaryController.text != _originalSummary) return true;
    if (_currentResultsLink != _originalResultsLink) return true;
    if (_newlyAddedMedia.isNotEmpty) return true;
    if (_mediaUrls.length != _originalMediaUrls.length) return true;
    for (int i = 0; i < _mediaUrls.length; i++) {
      if (_mediaUrls[i] != _originalMediaUrls[i]) return true;
    }
    return false;
  }

  void _handleBack() {
    // Only return data if it's the owner editing; otherwise just pop
    if (widget.isSelf) {
      _saveAndExit();
    } else {
      Navigator.pop(context);
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.black.withValues(alpha: 0.7),
      builder: (context) => Dialog(
        backgroundColor: AppColors.darkGreyCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.orangeGradientStart.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    color: AppColors.orangeGradientStart,
                    strokeWidth: 3,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(
                title: 'Saving Changes',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textColor: AppColors.white,
              ),
              const SizedBox(height: 8),
              CustomText(
                title: 'Please wait while we update your result...',
                fontSize: 13,
                textColor: AppColors.white.withValues(alpha: 0.6),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveAndExit() async {
    // If nothing changed, just go back
    if (!_hasChanges) {
      Navigator.pop(context);
      return;
    }

    final localStorage = sl<LocalStorageService>();
    final loggedInUser = localStorage.getUserData();
    if (loggedInUser == null) return;

    _showLoadingDialog();

    final data = {
      'competitionSummary': _summaryController.text,
      'resultLink': _currentResultsLink,
      if (_mediaUrls.isNotEmpty) 'media': _mediaUrls,
    };

    logger("Updating result with data: $data");
    logger("Existing media URLs: $_mediaUrls");
    logger("Newly added media count: ${_newlyAddedMedia.length}");

    ref
        .read(competitionResultsProvider(loggedInUser.id).notifier)
        .updateResult(
          athleteId: loggedInUser.id,
          resultId: widget.result.id,
          data: data,
          media: _newlyAddedMedia.isNotEmpty ? _newlyAddedMedia : null,
          onSuccess: () {
            if (!mounted) return;
            Navigator.pop(context); // Close loading dialog
            Navigator.pop(context); // Go back
          },
        );
  }

  Future<void> _pickMedia() async {
    if (!widget.isSelf) return;

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final newFile = File(image.path);
      setState(() {
        _uploadedMedia.add(newFile);
        _newlyAddedMedia.add(newFile); // Track as newly added
      });
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
          onPressed: _handleBack,
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
            isSelf: widget.isSelf,
            currentLink: _currentResultsLink,
            onLinkUpdated: (newLink) {
              if (widget.isSelf) {
                setState(() => _currentResultsLink = newLink);
              }
            },
          ),
          ResultMediaTab(
            mediaFiles: _uploadedMedia,
            mediaUrls: _mediaUrls,
            isSelf: widget.isSelf,
            onUpload: widget.isSelf ? _pickMedia : null,
            onDelete: widget.isSelf
                ? (index, isFile) {
                    setState(() {
                      if (isFile) {
                        final fileToRemove = _uploadedMedia[index];
                        _uploadedMedia.removeAt(index);
                        // Also remove from newly added if it exists there
                        _newlyAddedMedia.remove(fileToRemove);
                      } else {
                        _mediaUrls.removeAt(index);
                      }
                    });
                  }
                : null,
          ),
          ResultSummaryTab(
            controller: _summaryController,
            isSelf: widget.isSelf,
            onSave: widget.isSelf ? _saveAndExit : null,
          ),
        ],
      ),
    );
  }
}
