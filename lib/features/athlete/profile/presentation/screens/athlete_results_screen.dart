import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/competition_results_provider.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/competition_results_state.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/result_widget.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widgets/add_result_modal.dart';

class AthleteResultsScreen extends ConsumerStatefulWidget {
  final String? athleteId;
  final bool isSelf;

  const AthleteResultsScreen({super.key, this.athleteId, this.isSelf = true});

  @override
  ConsumerState<AthleteResultsScreen> createState() =>
      _AthleteResultsScreenState();
}

class _AthleteResultsScreenState extends ConsumerState<AthleteResultsScreen> {
  @override
  void initState() {
    super.initState();
    _fetchResults();
  }

  void _fetchResults() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localStorage = sl<LocalStorageService>();
      final loggedInUser = localStorage.getUserData();

      final targetId = widget.isSelf ? loggedInUser?.id : widget.athleteId;

      if (targetId != null) {
        ref.read(competitionResultsProvider.notifier).loadResults(targetId);
      }
    });
  }

  void _showAddResultModal({ResultData? record}) {
    if (!widget.isSelf) return;

    final localStorage = sl<LocalStorageService>();
    final user = localStorage.getUserData();
    if (user == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.black.withValues(alpha: 0.8),
      builder: (context) => AddResultModal(
        initialRecord: record,
        onSave: (newResult) {
          final data = {
            'competitionName': newResult.competition,
            'date': newResult.date,
            'position': int.tryParse(newResult.position.split('/').first) ?? 1,
            'totalCompetitors':
                int.tryParse(newResult.position.split('/').last) ?? 1,
            'division': newResult.division,
            'competitionSummary': newResult.summary,
            'resultLink': newResult.resultsLink,
          };

          if (record != null) {
            ref
                .read(competitionResultsProvider.notifier)
                .updateResult(
                  athleteId: user.id,
                  resultId:
                      "", // Ensure your provider/model handles ID correctly
                  data: data,
                  media: null,
                  onSuccess: () => Navigator.pop(context),
                );
          } else {
            ref
                .read(competitionResultsProvider.notifier)
                .createResult(
                  athleteId: user.id,
                  data: data,
                  media: null,
                  onSuccess: () => Navigator.pop(context),
                );
          }
        },
      ),
    );
  }

  void _showOptionsSheet(ResultData record) {
    if (!widget.isSelf) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkGreyCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined, color: AppColors.white),
              title: const CustomText(
                title: 'Edit Result',
                textColor: AppColors.white,
              ),
              onTap: () {
                Navigator.pop(context);
                _showAddResultModal(record: record);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.red),
              title: const CustomText(
                title: 'Delete Result',
                textColor: AppColors.red,
              ),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(competitionResultsProvider);

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
            size: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const CustomText(
          title: 'Results Datacenter',
          fontSize: 24,
          textColor: AppColors.orangeGradientStart,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: AppColors.orangeGradientStart,
          ),
        ),
        error: (message) => Center(
          child: CustomText(title: message, textColor: AppColors.white),
        ),
        loaded: (data) {
          final results = data.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: CustomText(
                  title: widget.isSelf
                      ? "Your complete competition history and achievements"
                      : "Competition history and achievements.",
                  fontSize: 15,
                  textColor: AppColors.white.withValues(alpha: 0.7),
                ),
              ),
              Expanded(
                child: results.isEmpty
                    ? ResultEmptyState(
                        isSelf: widget.isSelf,
                        onAdd: widget.isSelf
                            ? () => _showAddResultModal()
                            : null,
                      )
                    : Column(
                        children: [
                          const ResultTableHeader(),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: widget.isSelf
                                  ? results.length + 1
                                  : results.length,
                              itemBuilder: (context, index) {
                                if (widget.isSelf && index == results.length) {
                                  return ResultBottomActions(
                                    label: "Add more Result",
                                    onAdd: () => _showAddResultModal(),
                                    showCircleButton: true,
                                  );
                                }

                                final result = results[index];
                                final resultData = ResultData(
                                  date: result.date,
                                  position:
                                      '${result.position}/${result.totalCompetitors}',
                                  competition: result.competitionName,
                                  division: result.division,
                                  flagUrl: 'https://flagcdn.com/w40/tr.png',
                                  location: '',
                                  media: [],
                                  summary: result.competitionSummary,
                                  resultsLink: result.resultLink,
                                );

                                return GestureDetector(
                                  onTap: () {
                                    context.push(
                                      Routes.athleteResultDetialRouteName,
                                      extra: {
                                        'result': resultData,
                                        'isSelf': widget.isSelf,
                                        'athleteId': widget.athleteId,
                                      },
                                    );
                                  },
                                  onLongPress: widget.isSelf
                                      ? () => _showOptionsSheet(resultData)
                                      : null,
                                  child: ResultItem(data: resultData),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
