import 'package:athlink/di.dart';
import 'package:athlink/features/manage/presentation/providers/milestone_notifier.dart';
import 'package:athlink/features/manage/presentation/providers/state/milestone_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final milestoneProvider =
    StateNotifierProvider<MilestoneNotifier, MilestoneState>((ref) {
  return MilestoneNotifier(sl());
});
