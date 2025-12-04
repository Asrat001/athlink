import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/widgets/create_job_modal.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/post/empty_posts_state.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/post/posts_header.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/post/posts_list.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostFeedSection extends ConsumerWidget {
  final List<JobPost>? jobPosts;
  final SponsorProfile? sponsorProfile;
  final ProfileUser? profileUser;

  const PostFeedSection({
    super.key,
    this.jobPosts,
    this.sponsorProfile,
    this.profileUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortedPosts = _getSortedPosts();
    final agencyName = sponsorProfile?.name ?? 'No name set';
    final agencyImageUrl = sponsorProfile?.profileImageUrl;

    return Container(
      color: AppColors.lightGrey.withValues(alpha: .2),
      child: Column(
        children: [
          PostsHeader(
            onAddPressed: () =>
                _openCreateJobModal(context, profileUser?.sport ?? []),
          ),
          sortedPosts.isEmpty
              ? const EmptyPostsState()
              : PostsList(
                  posts: sortedPosts,
                  agencyName: agencyName,
                  agencyImageUrl: agencyImageUrl,
                ),
        ],
      ),
    );
  }

  List<JobPost> _getSortedPosts() {
    return (jobPosts ?? []).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  void _openCreateJobModal(BuildContext context, List<ProfileSport> sports) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => CreateJobModal(sports: sports),
    );
  }
}
