import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'post_card.dart';

class PostsList extends StatelessWidget {
  final List<JobPost> posts;
  final String agencyName;
  final String? agencyImageUrl;

  const PostsList({
    super.key,
    required this.posts,
    required this.agencyName,
    required this.agencyImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: posts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final post = posts[index];
        return PostCard(
          post: post,
          agencyName: agencyName,
          agencyImageUrl: agencyImageUrl,
        );
      },
    );
  }
}
