import 'dart:io';
import 'dart:typed_data';

import 'package:athlink/shared/widgets/create_job_step_one.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../features/profile/presenation/screens/widgets/post/media_selection_row.dart';
import '../../features/profile/presenation/screens/widgets/post/selected_files_info.dart';

class StepTwo extends StatefulWidget {
  final TextEditingController requirementsController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final File? selectedImage;
  final File? selectedVideo;
  final Uint8List? imageBytes;
  final Uint8List? videoThumbnail;
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(File image, Uint8List bytes) onImageSelected;
  final Function(File video, Uint8List? thumbnail) onVideoSelected;
  final VoidCallback onImageRemoved;
  final VoidCallback onVideoRemoved;
  final Function(DateTime date) onStartDateSelected;
  final Function(DateTime date) onEndDateSelected;
  final VoidCallback onPost;
  final VoidCallback onCancel;
  final bool isLoading;

  const StepTwo({
    super.key,
    required this.requirementsController,
    required this.startDateController,
    required this.endDateController,
    required this.selectedImage,
    required this.selectedVideo,
    required this.imageBytes,
    required this.videoThumbnail,
    required this.startDate,
    required this.endDate,
    required this.onImageSelected,
    required this.onVideoSelected,
    required this.onImageRemoved,
    required this.onVideoRemoved,
    required this.onStartDateSelected,
    required this.onEndDateSelected,
    required this.onPost,
    required this.onCancel,
    required this.isLoading,
  });

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      widget.onStartDateSelected(picked);
    }
  }

  Future<void> _pickEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.endDate ?? widget.startDate ?? DateTime.now(),
      firstDate: widget.startDate ?? DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      widget.onEndDateSelected(picked);
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 1024,
      );

      if (image != null) {
        final File imageFile = File(image.path);
        final Uint8List bytes = await imageFile.readAsBytes();
        widget.onImageSelected(imageFile, bytes);
      }
    } catch (e) {
      _showErrorSnackbar('Failed to pick image: $e');
    }
  }

  Future<void> _pickVideo() async {
    try {
      final XFile? video = await _picker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: const Duration(minutes: 5),
      );

      if (video != null) {
        final File videoFile = File(video.path);
        final Uint8List? thumbnail = await _generateVideoThumbnail(videoFile);
        widget.onVideoSelected(videoFile, thumbnail);
      }
    } catch (e) {
      _showErrorSnackbar('Failed to pick video: $e');
    }
  }

  Future<Uint8List?> _generateVideoThumbnail(File videoFile) async {
    try {
      final String? thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: videoFile.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 200,
        quality: 50,
      );

      if (thumbnailPath != null) {
        final File thumbnailFile = File(thumbnailPath);
        return await thumbnailFile.readAsBytes();
      }
    } catch (e) {
      print('Error generating thumbnail: $e');
    }
    return null;
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SectionTitle(title: "Add Media"),
        const SizedBox(height: 8),
        MediaSelectionRow(
          onImageSelected: _pickImage,
          onVideoSelected: _pickVideo,
          imageBytes: widget.imageBytes,
          videoThumbnail: widget.videoThumbnail,
          selectedImage: widget.selectedImage,
          selectedVideo: widget.selectedVideo,
          onImageRemoved: widget.onImageRemoved,
          onVideoRemoved: widget.onVideoRemoved,
        ),
        if (widget.selectedImage != null || widget.selectedVideo != null) ...[
          const SizedBox(height: 12),
          SelectedFilesInfo(
            image: widget.selectedImage,
            video: widget.selectedVideo,
          ),
        ],
        const SizedBox(height: 16),
        const SectionTitle(title: "Timeline"),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: DateField(
                hint: "Start Date",
                controller: widget.startDateController,
                onTap: _pickStartDate,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DateField(
                hint: "End Date",
                controller: widget.endDateController,
                onTap: _pickEndDate,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const SectionTitle(title: "Requirements"),
        const SizedBox(height: 8),
        InputField(
          hint: "Write a detailed description...",
          maxLines: 4,
          controller: widget.requirementsController,
        ),
        const SizedBox(height: 30),
        ActionButtons(
          isLoading: widget.isLoading,
          onPost: widget.onPost,
          onCancel: widget.onCancel,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class DateField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final VoidCallback onTap;

  const DateField({
    super.key,
    required this.hint,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          readOnly: true,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textGrey),
            filled: true,
            fillColor: AppColors.extraLightGrey.withValues(alpha: 0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(
              Icons.calendar_today,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPost;
  final VoidCallback onCancel;

  const ActionButtons({
    super.key,
    required this.isLoading,
    required this.onPost,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedButton(
          label: "Cancel",
          height: 48,
          width: MediaQuery.of(context).size.width * .43,
          borderRadius: 10,
          onPressed: isLoading ? null : onCancel,
        ),
        RoundedButton(
          label: isLoading ? "Posting..." : "Post",
          height: 48,
          borderRadius: 10,
          width: MediaQuery.of(context).size.width * .43,
          onPressed: isLoading ? null : onPost,
        ),
      ],
    );
  }
}
