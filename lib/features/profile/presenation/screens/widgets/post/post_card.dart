import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/post/post_content.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/post/post_image_header.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final JobPost post;
  final String agencyName;
  final String? agencyImageUrl;

  const PostCard({
    super.key,
    required this.post,
    required this.agencyName,
    required this.agencyImageUrl,
  });

  String _calculateDuration() {
    final startDate = post.timeline.startDate;
    final endDate = post.timeline.endDate;

    if (startDate == null || endDate == null) {
      return 'N/A';
    }

    final difference = endDate.difference(startDate);
    final months = (difference.inDays / 30).round();
    return months.toString();
  }

  String _getImageUrl() {
    return post.mediaUrls.isNotEmpty
        ? UrlHelper.getFullImageUrl(post.mediaUrls.first)
        : 'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?w=800';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(10),
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
            PostImageHeader(imageUrl: _getImageUrl()),
            PostContent(
              title: post.title,
              description: post.description,
              price: post.budget,
              duration: _calculateDuration(),
              agencyName: agencyName,
              location: post.location,
              agencyImageUrl: agencyImageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
