import 'dart:io';
import 'dart:typed_data';

import 'package:athlink/features/profile/domain/models/job_post_request.dart';
import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/features/profile/presenation/providers/job_post_provider.dart';
import 'package:athlink/features/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PostFeedSection extends StatelessWidget {
  final List<JobPost>? jobPosts;
  final SponsorProfile? sponsorProfile;
  final ProfileUser? profileUser;

  const PostFeedSection({
    super.key,
    this.jobPosts,
    this.sponsorProfile,
    this.profileUser,
  });

  String _calculateDuration(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) {
      return 'N/A';
    }
    final difference = endDate.difference(startDate);
    final months = (difference.inDays / 30).round();
    return months.toString();
  }

  @override
  Widget build(BuildContext context) {
    final posts = jobPosts ?? [];
    final agencyName = sponsorProfile?.name ?? 'SP Sport Agency';
    final agencyImageUrl = sponsorProfile?.profileImageUrl;

    return Container(
      color: AppColors.lightGrey.withValues(alpha: .2),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Expanded(child: CustomText(title: "Posts", fontSize: 20)),
                IconButton(
                  icon: Icon(Icons.add, size: 30, color: AppColors.black),
                  onPressed: () {
                    _openCreateJobModal(context, profileUser?.sport ?? []);
                  },
                ),
              ],
            ),
          ),
          posts.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: CustomText(
                    title: "No posts yet",
                    fontSize: 14,
                    textColor: AppColors.textGrey,
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: posts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    final duration = _calculateDuration(
                      post.timeline.startDate,
                      post.timeline.endDate,
                    );
                    final imageUrl = post.mediaUrls.isNotEmpty
                        ? UrlHelper.getFullImageUrl(post.mediaUrls.first)
                        : 'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?w=800';

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: _PostCard(
                        title: post.title,
                        subtitle: post.description,
                        price: '500', // Price not in API, using default
                        duration: duration,
                        agency: agencyName,
                        location: post.location,
                        imageUrl: imageUrl,
                        agencyImageUrl: agencyImageUrl,
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String duration;
  final String agency;
  final String location;
  final String imageUrl;
  final String? agencyImageUrl;

  const _PostCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.duration,
    required this.agency,
    required this.location,
    required this.imageUrl,
    this.agencyImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withValues(alpha: 0.8),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const CustomText(
                    title: 'Active',

                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.black,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                CustomText(
                  title: title,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.black,
                ),
                const SizedBox(height: 6),

                /// Subtitle
                CustomText(
                  title: subtitle,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.grey,
                ),
                const SizedBox(height: 12),

                Divider(color: AppColors.divider, thickness: 1),

                const SizedBox(height: 8),

                /// Price and Duration Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _InfoItem(value: price, label: '\$/m'),
                    SizedBox(width: 10),
                    _DividerLine(),
                    SizedBox(width: 10),
                    _InfoItem(value: duration, label: 'months.'),
                  ],
                ),

                const SizedBox(height: 10),
                Divider(color: AppColors.divider, thickness: 1),
                const SizedBox(height: 10),

                /// Agency Info
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.lightGrey,
                                width: 2.0,
                              ),
                            ),
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.black,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: agencyImageUrl != null
                                    ? Image.network(
                                        UrlHelper.getFullImageUrl(
                                          agencyImageUrl,
                                        ),
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Icon(
                                                Icons.business,
                                                size: 30,
                                                color: AppColors.grey,
                                              );
                                            },
                                      )
                                    : Icon(
                                        Icons.business,
                                        size: 30,
                                        color: AppColors.grey,
                                      ),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 5,
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: AppColors.success,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: agency,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          textColor: AppColors.black,
                        ),
                        const SizedBox(height: 2),
                        CustomText(
                          title: location,
                          textColor: AppColors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),

                const SizedBox(height: 18),

                RoundedButton(
                  height: 50,
                  width: double.infinity,
                  label: "View Detail",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String value;
  final String label;
  const _InfoItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          title: value,

          fontSize: 16,
          fontWeight: FontWeight.w700,
          textColor: AppColors.primary,
        ),
        const SizedBox(height: 4),
        CustomText(
          title: label,
          fontSize: 12,
          textColor: AppColors.grey,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 50, color: AppColors.grey);
  }
}

void _openCreateJobModal(BuildContext context, List<ProfileSport> sports) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _CreateJobModal(sports: sports),
  );
}

class _CreateJobModal extends ConsumerStatefulWidget {
  final List<ProfileSport> sports;

  const _CreateJobModal({required this.sports});

  @override
  ConsumerState<_CreateJobModal> createState() => _CreateJobModalState();
}

class _CreateJobModalState extends ConsumerState<_CreateJobModal>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;

  // Form controllers
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _budgetController = TextEditingController();
  final _requirementsController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  // Selected sport
  String? _selectedSportId;
  String? _selectedSportName;

  // Media files
  File? _selectedImage;
  File? _selectedVideo;
  Uint8List? _imageBytes;
  Uint8List? _videoThumbnail;

  // Dates
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
    // Validate step 1
    if (_titleController.text.trim().isEmpty) {
      _showErrorSnackbar('Please enter a job title');
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
    // Format as YYYY-MM-DD (e.g., 2023-06-01)
    final year = date.year.toString();
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  Future<void> _submitJobPost() async {
    // Validate required fields
    if (_titleController.text.trim().isEmpty) {
      _showErrorSnackbar('Please enter a job title');
      return;
    }

    // Prepare media files
    final List<String> mediaFiles = [];
    if (_selectedImage != null) {
      mediaFiles.add(_selectedImage!.path);
    }
    if (_selectedVideo != null) {
      mediaFiles.add(_selectedVideo!.path);
    }

    // Create request with properly formatted dates
    final request = JobPostRequest(
      title: _titleController.text.trim(),
      sportId: _selectedSportId,
      location: _locationController.text.trim().isNotEmpty
          ? _locationController.text.trim()
          : null,
      description: _descriptionController.text.trim().isNotEmpty
          ? _descriptionController.text.trim()
          : null,
      timelineStart: _formatDateForApi(
        _startDate,
      ), // Use DateTime instead of text
      timelineEnd: _formatDateForApi(
        _endDate,
      ), // Use DateTime instead of text
      requirements: _requirementsController.text.trim().isNotEmpty
          ? _requirementsController.text.trim()
          : null,
      media: mediaFiles.isNotEmpty ? mediaFiles : null,
    );

    // Submit
    await ref.read(jobPostProvider.notifier).createJobPost(request);

    // Check result
    final jobPostState = ref.read(jobPostProvider);
    if (jobPostState.isSuccess) {
      _showSuccessSnackbar(
        jobPostState.successMessage ?? 'Job post created successfully!',
      );
      // Refresh profile to get updated job posts
      ref.read(profileProvider.notifier).getProfile();
      Navigator.pop(context);
    } else if (jobPostState.errorMessage != null) {
      _showErrorSnackbar(jobPostState.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final jobPostState = ref.watch(jobPostProvider);

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage == 1)
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/step-back.svg',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: jobPostState.isLoading ? null : _previousPage,
                  )
                else
                  const SizedBox(width: 40),
                CustomText(
                  title: "Create Job Post",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.black,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 24,
                    color: AppColors.grey,
                  ),
                  onPressed: jobPostState.isLoading
                      ? null
                      : () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepCircle(1, isActive: true),
                const SizedBox(width: 8),
                Container(width: 40, height: 2, color: AppColors.divider),
                const SizedBox(width: 8),
                _buildStepCircle(2, isActive: _currentPage == 1),
              ],
            ),

            const SizedBox(height: 20),

            // PageView for step animations
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _StepOne(
                    onNext: _nextPage,
                    sports: widget.sports,
                    titleController: _titleController,
                    locationController: _locationController,
                    descriptionController: _descriptionController,
                    budgetController: _budgetController,
                    selectedSportId: _selectedSportId,
                    selectedSportName: _selectedSportName,
                    onSportSelected: (sportId, sportName) {
                      setState(() {
                        _selectedSportId = sportId;
                        _selectedSportName = sportName;
                      });
                    },
                  ),
                  _StepTwo(
                    onPost: _submitJobPost,
                    onCancel: () => Navigator.pop(context),
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
                    isLoading: jobPostState.isLoading,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(int step, {required bool isActive}) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.extraLightGrey,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$step',
        style: TextStyle(
          color: isActive ? AppColors.white : AppColors.textSecondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _StepOne extends StatelessWidget {
  final VoidCallback onNext;
  final List<ProfileSport> sports;
  final TextEditingController titleController;
  final TextEditingController locationController;
  final TextEditingController descriptionController;
  final TextEditingController budgetController;
  final String? selectedSportId;
  final String? selectedSportName;
  final Function(String sportId, String sportName) onSportSelected;

  const _StepOne({
    required this.onNext,
    required this.sports,
    required this.titleController,
    required this.locationController,
    required this.descriptionController,
    required this.budgetController,
    required this.selectedSportId,
    required this.selectedSportName,
    required this.onSportSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const CustomText(
          title: "Job Title",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField(
          "e.g. Football Sponsorship Opportunity",
          controller: titleController,
        ),
        const SizedBox(height: 16),

        const CustomText(
          title: "Category",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),

        sports.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CustomText(
                  title: "No sports available",
                  fontSize: 14,
                  textColor: AppColors.textGrey,
                ),
              )
            : SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final sport = sports[index];
                    final isSelected = selectedSportId == sport.id;
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: _chip(
                        sport.name,
                        isSelected: isSelected,
                        onTap: () => onSportSelected(sport.id, sport.name),
                      ),
                    );
                  },
                  itemCount: sports.length,
                ),
              ),

        const SizedBox(height: 16),

        const CustomText(
          title: "Location",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField("e.g. Paris, France", controller: locationController),
        const SizedBox(height: 16),

        const CustomText(
          title: "Description",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField(
          "Write a detailed description...",
          maxLines: 4,
          controller: descriptionController,
        ),
        const SizedBox(height: 16),

        const CustomText(
          title: "Budget Range",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField("e.g. \$5,000 - \$20,000", controller: budgetController),

        // Next button as part of the scrollable content
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerRight,
          child: RoundedButton(
            label: "Next",
            height: 40,
            width: 100,
            borderRadius: 10,
            onPressed: onNext,
          ),
        ),
        const SizedBox(height: 20), // Extra padding at bottom
      ],
    );
  }

  Widget _inputField(
    String hint, {
    int maxLines = 1,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.extraLightGrey.withValues(alpha: 0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _chip(String label, {bool isSelected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
          ),
        ),
        backgroundColor: isSelected
            ? AppColors.primary
            : AppColors.extraLightGrey,
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.extraLightGrey,
        ),
        labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _StepTwo extends StatefulWidget {
  final VoidCallback onPost;
  final VoidCallback onCancel;
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
  final bool isLoading;

  const _StepTwo({
    required this.onPost,
    required this.onCancel,
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
    required this.isLoading,
  });

  @override
  State<_StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<_StepTwo> {
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

        // Generate thumbnail for video
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
        const CustomText(
          title: "Add Media",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _mediaBox(
                Icons.image_outlined,
                isImage: true,
                isSelected: widget.selectedImage != null,
                thumbnail: widget.imageBytes,
                onTap: _pickImage,
                onRemove: widget.onImageRemoved,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _mediaBox(
                Icons.videocam_outlined,
                isImage: false,
                isSelected: widget.selectedVideo != null,
                thumbnail: widget.videoThumbnail,
                onTap: _pickVideo,
                onRemove: widget.onVideoRemoved,
              ),
            ),
          ],
        ),

        // Selected files info
        if (widget.selectedImage != null || widget.selectedVideo != null) ...[
          const SizedBox(height: 12),
          _SelectedFilesInfo(
            image: widget.selectedImage,
            video: widget.selectedVideo,
          ),
        ],

        const SizedBox(height: 16),
        const CustomText(
          title: "Timeline",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _dateField(
                "Start Date",
                controller: widget.startDateController,
                onTap: _pickStartDate,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _dateField(
                "End Date",
                controller: widget.endDateController,
                onTap: _pickEndDate,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        const CustomText(
          title: "Requirements",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField(
          "Write a detailed description...",
          maxLines: 4,
          controller: widget.requirementsController,
        ),

        // Cancel and Post buttons as part of the scrollable content
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedButton(
              label: "Cancel",
              height: 48,
              width: MediaQuery.of(context).size.width * .43,
              borderRadius: 10,
              onPressed: widget.isLoading ? null : widget.onCancel,
            ),
            RoundedButton(
              label: widget.isLoading ? "Posting..." : "Post",
              height: 48,
              borderRadius: 10,
              width: MediaQuery.of(context).size.width * .43,
              onPressed: widget.isLoading ? null : widget.onPost,
            ),
          ],
        ),
        const SizedBox(height: 20), // Extra padding at bottom
      ],
    );
  }

  Widget _mediaBox(
    IconData icon, {
    required bool isImage,
    required bool isSelected,
    required Uint8List? thumbnail,
    required VoidCallback onTap,
    required VoidCallback onRemove,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.success.withValues(alpha: .3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // Thumbnail or icon
            if (thumbnail != null && isSelected)
              ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.memory(
                  thumbnail,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderIcon(icon);
                  },
                ),
              )
            else
              _buildPlaceholderIcon(icon),

            // Selected indicator
            if (isSelected)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 12,
                  ),
                ),
              ),

            // Remove button
            if (isSelected)
              Positioned(
                top: 4,
                left: 4,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon(IconData icon) {
    return Center(child: Icon(icon, color: AppColors.lightGrey, size: 40));
  }

  Widget _inputField(
    String hint, {
    int maxLines = 1,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
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
      ),
    );
  }

  Widget _dateField(
    String hint, {
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
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

class _SelectedFilesInfo extends StatelessWidget {
  final File? image;
  final File? video;

  const _SelectedFilesInfo({this.image, this.video});

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1048576) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / 1048576).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null)
          _FileInfoItem(
            icon: Icons.image,
            name: image!.path.split('/').last,
            size: _formatFileSize(image!.lengthSync()),
            type: 'Image',
          ),
        if (video != null)
          _FileInfoItem(
            icon: Icons.videocam,
            name: video!.path.split('/').last,
            size: _formatFileSize(video!.lengthSync()),
            type: 'Video',
          ),
      ],
    );
  }
}

class _FileInfoItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String size;
  final String type;

  const _FileInfoItem({
    required this.icon,
    required this.name,
    required this.size,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.extraLightGrey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$type • $size',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
