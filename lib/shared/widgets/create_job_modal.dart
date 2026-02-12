import 'dart:io';
import 'dart:typed_data';

import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/sponsor/profile/domain/models/job_post_request.dart';
import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/job_post_provider.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/shared/widgets/create_job_modal_layout.dart';
import 'package:athlink/shared/widgets/create_job_step_one.dart';
import 'package:athlink/shared/widgets/create_job_step_two.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/sponsor/manage/domain/models/job_list_model.dart'
    as manage_models;

class CreateJobModal extends ConsumerStatefulWidget {
  final List<ProfileSport> sports;
  final manage_models.JobPostItem? initialJob;

  const CreateJobModal({super.key, required this.sports, this.initialJob});

  @override
  ConsumerState<CreateJobModal> createState() => _CreateJobModalState();
}

class _CreateJobModalState extends ConsumerState<CreateJobModal> {
  late PageController _pageController;
  int _currentPage = 0;
  final _formKey = GlobalKey<FormState>();

  // Step One Data
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _budgetController = TextEditingController();
  String? _selectedSportId;
  String? _selectedSportName;
  String _selectedCurrency = 'USD';

  // Step Two Data
  final _requirementsController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  File? _selectedImage;
  File? _selectedVideo;
  Uint8List? _imageBytes;
  Uint8List? _videoThumbnail;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.initialJob != null) {
      final job = widget.initialJob!;
      _titleController.text = job.title;
      _locationController.text = job.location;
      _descriptionController.text = job.description;
      _budgetController.text = job.price;
      _selectedSportId = job.sportId.id;
      _selectedSportName = job.sportId.name;
      _selectedCurrency = job.currency;
      _requirementsController.text = job.requirements;

      if (job.timeline.startDate != null) {
        _startDate = job.timeline.startDate;
        _startDateController.text =
            '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}';
      }
      if (job.timeline.endDate != null) {
        _endDate = job.timeline.endDate;
        _endDateController.text =
            '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}';
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    _requirementsController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (_selectedSportId == null) {
      _showErrorSnackbar('Please select a sport category');
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = 1);
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = 0);
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

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String? _formatDateForApi(DateTime? date) {
    if (date == null) return null;
    final year = date.year.toString();
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  Future<void> _submitJobPost() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final List<String> mediaFiles = [];
    if (_selectedImage != null) {
      mediaFiles.add(_selectedImage!.path);
    }
    if (_selectedVideo != null) {
      mediaFiles.add(_selectedVideo!.path);
    }

    if (widget.initialJob != null) {
      final request = UpdateJobPostRequest(
        title: _titleController.text.trim(),
        sportId: _selectedSportId,
        location: _locationController.text.trim().isNotEmpty
            ? _locationController.text.trim()
            : null,
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        timelineStart: _formatDateForApi(_startDate),
        timelineEnd: _formatDateForApi(_endDate),
        requirements: _requirementsController.text.trim().isNotEmpty
            ? _requirementsController.text.trim()
            : null,
        media: mediaFiles.isNotEmpty ? mediaFiles : null,
        price: _budgetController.text.trim().isNotEmpty
            ? double.parse(_budgetController.text.trim())
            : null,
        currency: _selectedCurrency,
      );

      await ref
          .read(jobPostProvider.notifier)
          .updateJobPost(widget.initialJob!.id, request);
    } else {
      final request = JobPostRequest(
        title: _titleController.text.trim(),
        sportId: _selectedSportId,
        location: _locationController.text.trim().isNotEmpty
            ? _locationController.text.trim()
            : null,
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        timelineStart: _formatDateForApi(_startDate),
        timelineEnd: _formatDateForApi(_endDate),
        requirements: _requirementsController.text.trim().isNotEmpty
            ? _requirementsController.text.trim()
            : null,
        media: mediaFiles.isNotEmpty ? mediaFiles : null,
        price: _budgetController.text.trim().isNotEmpty
            ? double.parse(_budgetController.text.trim())
            : null,
        currency: _selectedCurrency,
      );

      await ref.read(jobPostProvider.notifier).createJobPost(request);
    }

    if (!mounted) return;

    final jobPostState = ref.read(jobPostProvider);
    if (jobPostState.isSuccess) {
      _showSuccessSnackbar(
        jobPostState.successMessage ??
            (widget.initialJob != null
                ? 'Job post updated successfully!'
                : 'Job post created successfully!'),
      );
      final sponsorId = sl<LocalStorageService>().getUserData()?.id;
      if (sponsorId != null) {
        ref.read(profileProvider(sponsorId).notifier).getProfile(sponsorId);
      }
      Navigator.pop(context);
    } else if (jobPostState.errorMessage != null) {
      _showErrorSnackbar(jobPostState.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final jobPostState = ref.watch(jobPostProvider);

    return Form(
      key: _formKey,
      child: CreateJobModalLayout(
        currentPage: _currentPage,
        pageController: _pageController,
        onPreviousPage: _previousPage,
        onClose: () => Navigator.pop(context),
        isLoading: jobPostState.isLoading,
        errorMessage: jobPostState.errorMessage,
        stepOne: StepOne(
          sports: widget.sports,
          titleController: _titleController,
          locationController: _locationController,
          descriptionController: _descriptionController,
          budgetController: _budgetController,
          selectedSportId: _selectedSportId,
          selectedSportName: _selectedSportName,
          selectedCurrency: _selectedCurrency,
          onSportSelected: (sportId, sportName) {
            setState(() {
              _selectedSportId = sportId;
              _selectedSportName = sportName;
            });
          },
          onCurrencySelected: (currency) {
            setState(() {
              _selectedCurrency = currency;
            });
          },
          onNext: _nextPage,
        ),
        stepTwo: StepTwo(
          requirementsController: _requirementsController,
          startDateController: _startDateController,
          endDateController: _endDateController,
          selectedImage: _selectedImage,
          selectedVideo: _selectedVideo,
          imageBytes: _imageBytes,
          videoThumbnail: _videoThumbnail,
          startDate: _startDate,
          endDate: _endDate,
          onImageSelected: (image, bytes) {
            setState(() {
              _selectedImage = image;
              _imageBytes = bytes;
            });
          },
          onVideoSelected: (video, thumbnail) {
            setState(() {
              _selectedVideo = video;
              _videoThumbnail = thumbnail;
            });
          },
          onImageRemoved: () {
            setState(() {
              _selectedImage = null;
              _imageBytes = null;
            });
          },
          onVideoRemoved: () {
            setState(() {
              _selectedVideo = null;
              _videoThumbnail = null;
            });
          },
          onStartDateSelected: (date) {
            setState(() {
              _startDate = date;
              _startDateController.text =
                  '${date.day}/${date.month}/${date.year}';
            });
          },
          onEndDateSelected: (date) {
            setState(() {
              _endDate = date;
              _endDateController.text =
                  '${date.day}/${date.month}/${date.year}';
            });
          },
          onPost: _submitJobPost,
          onCancel: () => Navigator.pop(context),
          isLoading: jobPostState.isLoading,
        ),
      ),
    );
  }
}
