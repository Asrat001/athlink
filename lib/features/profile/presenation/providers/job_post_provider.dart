import 'package:athlink/di.dart';
import 'package:athlink/features/profile/domain/repository/job_post_repository.dart';
import 'package:athlink/features/profile/presenation/providers/job_post_notifier.dart';
import 'package:athlink/features/profile/presenation/providers/state/job_post_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobPostProvider =
    StateNotifierProvider<JobPostNotifier, JobPostState>((ref) {
  return JobPostNotifier(sl<JobPostRepository>());
});
