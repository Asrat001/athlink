import 'dart:io';
import 'dart:typed_data';

import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PostFeedSection extends StatelessWidget {
  PostFeedSection({super.key});

  final List<Map<String, dynamic>> posts = [
    {
      'title': 'Brand Ambassador Deal',
      'subtitle':
          'Track and field athletes aged 18 - 21, with social media presence.',
      'price': '500',
      'duration': '6',
      'agency': 'SP Sport Agency',
      'location': 'Los Angeles, CA',
      'image':
          'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?w=800',
    },
    {
      'title': 'Endorsement Opportunity',
      'subtitle': 'Basketball athletes aged 20 - 25 with community engagement.',
      'price': '800',
      'duration': '3',
      'agency': 'Prime Sports',
      'location': 'New York, NY',
      'image':
          'https://images.unsplash.com/photo-1509021436665-8f07dbf5bf1d?w=800',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                    _openCreateJobModal(context);
                  },
                ),
              ],
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: posts.length,
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // ✅ Prevents scroll conflict
            itemBuilder: (context, index) {
              final post = posts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: _PostCard(
                  title: post['title'],
                  subtitle: post['subtitle'],
                  price: post['price'],
                  duration: post['duration'],
                  agency: post['agency'],
                  location: post['location'],
                  imageUrl: post['image'],
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

  const _PostCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.duration,
    required this.agency,
    required this.location,
    required this.imageUrl,
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
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?w=800",
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
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

void _openCreateJobModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => const _CreateJobModal(),
  );
}

class _CreateJobModal extends StatefulWidget {
  const _CreateJobModal();

  @override
  State<_CreateJobModal> createState() => _CreateJobModalState();
}

class _CreateJobModalState extends State<_CreateJobModal>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _nextPage() {
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

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

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
                    onPressed: _previousPage,
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
                  onPressed: () => Navigator.pop(context),
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
                  _StepOne(onNext: _nextPage),
                  _StepTwo(
                    onPost: () {
                      // Handle post logic here
                      Navigator.pop(context);
                    },
                    onCancel: () => Navigator.pop(context),
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

  _StepOne({required this.onNext});

  List<String> sportCategories = [
    "Football",
    "Basketball",
    "Tennis",
    "Athletics",
    "Chess",
    "Cricket",
    "Rugby",
    "Swimming",
    "Others",
  ];

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
        _inputField("e.g. Football Sponsorship Opportunity"),
        const SizedBox(height: 16),

        const CustomText(
          title: "Category",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),

        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(right: 10),
              child: _chip(sportCategories[index]),
            ),
            itemCount: sportCategories.length,
          ),
        ),

        const SizedBox(height: 16),

        const CustomText(
          title: "Location",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField("e.g. Paris, France"),
        const SizedBox(height: 16),

        const CustomText(
          title: "Description",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField("Write a detailed description...", maxLines: 4),
        const SizedBox(height: 16),

        const CustomText(
          title: "Budget Range",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField("e.g. \$5,000 - \$20,000"),

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

  Widget _inputField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.extraLightGrey.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _chip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(color: AppColors.textPrimary)),
      backgroundColor: AppColors.extraLightGrey,
      side: BorderSide(color: AppColors.extraLightGrey),
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

class _StepTwo extends StatefulWidget {
  final VoidCallback onPost;
  final VoidCallback onCancel;

  const _StepTwo({required this.onPost, required this.onCancel});

  @override
  State<_StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<_StepTwo> {
  File? _selectedImage;
  File? _selectedVideo;
  Uint8List? _imageBytes;
  Uint8List? _videoThumbnail;

  final ImagePicker _picker = ImagePicker();

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

        setState(() {
          _selectedImage = imageFile;
          _imageBytes = bytes;
        });
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

        setState(() {
          _selectedVideo = videoFile;
          _videoThumbnail = thumbnail;
        });
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

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _imageBytes = null;
    });
  }

  void _removeVideo() {
    setState(() {
      _selectedVideo = null;
      _videoThumbnail = null;
    });
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
                isSelected: _selectedImage != null,
                thumbnail: _imageBytes,
                onTap: _pickImage,
                onRemove: _removeImage,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _mediaBox(
                Icons.videocam_outlined,
                isImage: false,
                isSelected: _selectedVideo != null,
                thumbnail: _videoThumbnail,
                onTap: _pickVideo,
                onRemove: _removeVideo,
              ),
            ),
          ],
        ),

        // Selected files info
        if (_selectedImage != null || _selectedVideo != null) ...[
          const SizedBox(height: 12),
          _SelectedFilesInfo(image: _selectedImage, video: _selectedVideo),
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
            Expanded(child: _inputField("Start Date")),
            const SizedBox(width: 12),
            Expanded(child: _inputField("End Date")),
          ],
        ),
        const SizedBox(height: 16),

        const CustomText(
          title: "Requirements",
          fontWeight: FontWeight.w600,
          textColor: AppColors.textPrimary,
        ),
        const SizedBox(height: 8),
        _inputField("Write a detailed description...", maxLines: 4),

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
              onPressed: widget.onCancel,
            ),
            RoundedButton(
              label: "Post",
              height: 48,
              borderRadius: 10,
              width: MediaQuery.of(context).size.width * .43,
              onPressed: widget.onPost,
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

  Widget _inputField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.extraLightGrey.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
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
