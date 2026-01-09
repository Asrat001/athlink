import 'package:athlink/di.dart';
import 'package:athlink/features/sponsor/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_notifier.dart';
import 'package:athlink/features/sponsor/manage/presentation/providers/state/job_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobListProvider = StateNotifierProvider<JobListNotifier, JobListState>((
  ref,
) {
  return JobListNotifier(sl<JobListRepository>());
});
