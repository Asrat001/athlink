import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/result_widget.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import '../widgets/add_result_modal.dart';

class AthleteResultsScreen extends StatefulWidget {
  const AthleteResultsScreen({super.key});

  @override
  State<AthleteResultsScreen> createState() => _AthleteResultsScreenState();
}

class _AthleteResultsScreenState extends State<AthleteResultsScreen> {
  final List<ResultData> _results = [
    ResultData(
      date: '7/Feb/2023',
      position: '4/47',
      competition: 'Regional Champions league',
      division: "Women's Open",
      flagUrl: 'https://flagcdn.com/w40/tr.png',
    ),
  ];

  /// Opens the modal to add a new result or edit an existing one
  void _showAddResultModal({ResultData? record, int? index}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.black.withValues(alpha: 0.8),
      builder: (context) => AddResultModal(
        initialRecord: record,
        onSave: (newResult) {
          setState(() {
            if (index != null) {
              _results[index] = newResult;
            } else {
              _results.add(newResult);
            }
          });
        },
      ),
    );
  }

  /// Quick options sheet for editing/deleting on long press
  void _showOptionsSheet(ResultData record, int index) {
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
                fontSize: 16,
              ),
              onTap: () {
                Navigator.pop(context);
                _showAddResultModal(record: record, index: index);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.red),
              title: const CustomText(
                title: 'Delete Result',
                textColor: AppColors.red,
                fontSize: 16,
              ),
              onTap: () {
                setState(() => _results.removeAt(index));
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: false,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: CustomText(
              title: _results.isNotEmpty
                  ? "Maria’s complete competition history and achievements"
                  : "Your complete competition history and achievements",
              fontSize: 15,
              textColor: AppColors.white.withValues(alpha: 0.7),
            ),
          ),

          // Conditional UI based on whether results list is empty
          Expanded(
            child: _results.isEmpty
                ? ResultEmptyState(onAdd: () => _showAddResultModal())
                : Column(
                    children: [
                      const ResultTableHeader(),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          // Added +1 to the count to include the bottom "Add More" button
                          itemCount: _results.length + 1,
                          itemBuilder: (context, index) {
                            // If it's the last item, show the bottom action button
                            if (index == _results.length) {
                              return ResultBottomActions(
                                label: "Add more Result",
                                onAdd: () => _showAddResultModal(),
                                showCircleButton: true,
                              );
                            }

                            final data = _results[index];
                            return GestureDetector(
                              onTap: () async {
                                final updatedData = await context
                                    .push<ResultData>(
                                      Routes.athleteResultDetialRouteName,
                                      extra: data,
                                    );

                                if (updatedData != null && mounted) {
                                  setState(() {
                                    _results[index] = updatedData;
                                  });
                                }
                              },
                              onLongPress: () => _showOptionsSheet(data, index),
                              child: ResultItem(data: data),
                            );
                          },
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
