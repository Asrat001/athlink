import 'package:athlink/features/manage/presentation/screens/manage_enums.dart';
import 'package:flutter/widgets.dart';

class JobsTab extends StatelessWidget {
  const JobsTab({super.key, required this.jobSectionState});
  final JobsSectionState jobSectionState;

  @override
  Widget build(BuildContext context) {
    return switch (jobSectionState) {
      JobsSectionState.listing => const Placeholder(),
      JobsSectionState.applicants => const Placeholder(),
      JobsSectionState.jobDetail => const Placeholder(),
      JobsSectionState.baDetail => const Placeholder(),
    };
  }
}