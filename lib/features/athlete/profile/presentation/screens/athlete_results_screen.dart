import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/result_widget.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: CustomText(
              title: "Maria’s complete competition history and achievements",
              fontSize: 15,
              textColor: AppColors.white.withValues(alpha: 0.7),
            ),
          ),
          const ResultTableHeader(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final data = _results[index];
                return GestureDetector(
                  onTap: () async {
                    // Navigate and wait for potential updates
                    final updatedData = await context.push<ResultData>(
                      Routes.athleteResultDetialRouteName,
                      extra: data,
                    );

                    // If updatedData is returned, refresh the UI
                    if (updatedData != null && mounted) {
                      setState(() {
                        _results[index] = updatedData;
                      });
                    }
                  },
                  child: ResultItem(data: data),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
