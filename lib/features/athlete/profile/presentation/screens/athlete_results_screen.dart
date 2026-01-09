import 'package:athlink/features/athlete/profile/presentation/widgets/result_widget.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import '../widgets/add_result_modal.dart';

class ResultData {
  final String date;
  final String position;
  final String competition;
  final String division;
  final String flagUrl;

  ResultData({
    required this.date,
    required this.position,
    required this.competition,
    required this.division,
    required this.flagUrl,
  });
}

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
        backgroundColor: AppColors.black, // Solid black to hide scroll bleed
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
          if (_results.isNotEmpty) ...[
            const ResultTableHeader(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _results.length + 1,
                itemBuilder: (context, index) {
                  if (index == _results.length) {
                    return ResultBottomActions(
                      label: "Add more Result",
                      onAdd: () => _showAddResultModal(),
                      showCircleButton: true,
                    );
                  }
                  final data = _results[index];
                  return GestureDetector(
                    onTap: () => context.push(
                      Routes.athleteResultDetialRouteName,
                      extra: data,
                    ),
                    onLongPress: () => _showOptionsSheet(data, index),
                    child: ResultItem(data: data),
                  );
                },
              ),
            ),
          ] else ...[
            Expanded(
              child: ResultEmptyState(onAdd: () => _showAddResultModal()),
            ),
          ],
        ],
      ),
    );
  }
}
