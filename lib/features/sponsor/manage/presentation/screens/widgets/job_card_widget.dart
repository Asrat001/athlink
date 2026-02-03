import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// Job card widget displaying job information
class JobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const JobCard({
    super.key,
    required this.job,
    required this.onTap,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            _buildHeader(context),
            const SizedBox(height: 16),

            // Price + title
            _buildPriceAndTitle(),

            const SizedBox(height: 12),
            const Divider(color: AppColors.extraLightGrey, height: 1),
            const SizedBox(height: 12),

            // Tags
            _buildTags(),

            const SizedBox(height: 20),

            // Action icons
            _buildActionIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.lightGrey, width: 2),
                ),
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.black,
                  backgroundImage: NetworkImage(job["agencyLogo"]),
                  onBackgroundImageError: (_, __) =>
                      const Icon(Icons.work, color: AppColors.white),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 4,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        // Title + subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: job["agencyName"],
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            CustomText(
              title: job["location"],
              fontSize: 14,
              textColor: AppColors.grey,
            ),
          ],
        ),
        const Spacer(),

        // More icon with PopupMenu
        PopupMenuButton<String>(
          icon: const Icon(
            Icons.more_vert,
            size: 22,
            color: AppColors.lightGrey,
          ),
          onSelected: (value) {
            if (value == 'delete' && onDelete != null) {
              onDelete!();
            } else if (value == 'edit' && onEdit != null) {
              onEdit!();
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit_outlined, color: AppColors.primary, size: 20),
                  SizedBox(width: 8),
                  CustomText(title: 'Edit', textColor: AppColors.primary),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete_outline, color: AppColors.red, size: 20),
                  SizedBox(width: 8),
                  CustomText(title: 'Delete', textColor: AppColors.red),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceAndTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: job["price"],
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        const SizedBox(height: 6),
        CustomText(
          title: job["title"],
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ],
    );
  }

  Widget _buildTags() {
    final tags = job["tags"] as List;
    if (tags.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags
          .map<Widget>(
            (tag) =>
                CustomText(title: tag, fontSize: 12, textColor: AppColors.blue),
          )
          .toList(),
    );
  }

  Widget _buildActionIcons() {
    return const Row(
      children: [
        Icon(Icons.share_outlined, size: 22, color: AppColors.lightGrey),
        SizedBox(width: 30),
        Icon(Icons.favorite, size: 22, color: AppColors.red),
        SizedBox(width: 30),
        Icon(Icons.bookmark_border, size: 22, color: AppColors.lightGrey),
      ],
    );
  }
}
