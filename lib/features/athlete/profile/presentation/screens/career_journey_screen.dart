import 'package:athlink/features/athlete/profile/presentation/widgets/career_widget.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import '../widgets/add_career_modal.dart';

class CareerRecord {
  final String logoUrl;
  final String position;
  final String team;
  final String location;
  final String duration;
  final String achievements;
  final String description;

  CareerRecord({
    required this.logoUrl,
    required this.position,
    required this.team,
    required this.location,
    required this.duration,
    required this.achievements,
    required this.description,
  });
}

class CareerJourneyScreen extends StatefulWidget {
  const CareerJourneyScreen({super.key});

  @override
  State<CareerJourneyScreen> createState() => _CareerJourneyScreenState();
}

class _CareerJourneyScreenState extends State<CareerJourneyScreen> {
  final List<CareerRecord> _careerRecords = [
    CareerRecord(
      logoUrl: 'https://i.ibb.co/vzB7pGq/packers-logo.png',
      position: 'Center Back',
      team: 'Green Bay Packers',
      location: 'Wisconsin, USA',
      duration: '2022 - Present',
      achievements: 'Team Captain',
      description: 'Defensive lead for the first team.',
    ),
  ];

  void _showCareerModal({CareerRecord? record, int? index}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.black.withValues(alpha: 0.8), // Darker overlay
      builder: (context) => AddCareerModal(
        initialRecord: record,
        onSave: (newRecord) {
          setState(() {
            if (index != null) {
              _careerRecords[index] = newRecord;
            } else {
              _careerRecords.add(newRecord);
            }
          });
        },
      ),
    );
  }

  void _showOptionsSheet(CareerRecord record, int index) {
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
            // Grab Handle for better UX
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
                title: 'Edit Journey',
                textColor: AppColors.white,
                fontSize: 16,
              ),
              onTap: () {
                Navigator.pop(context);
                _showCareerModal(record: record, index: index);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.red),
              title: const CustomText(
                title: 'Delete Record',
                textColor: AppColors.red,
                fontSize: 16,
              ),
              onTap: () {
                setState(() => _careerRecords.removeAt(index));
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
        backgroundColor:
            AppColors.black, // Changed to solid to avoid text bleed
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
          title: 'Career Journey',
          fontSize: 24,
          textColor: AppColors.orangeGradientStart,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomText(
              title: 'Your complete work records appear here.',
              fontSize: 15,
              textColor: AppColors.white.withValues(alpha: 0.7),
            ),
          ),
          Expanded(
            child: _careerRecords.isEmpty
                ? CareerEmptyState(onAdd: () => _showCareerModal())
                : Stack(
                    children: [
                      ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 150),
                        itemCount: _careerRecords.length,
                        itemBuilder: (context, index) {
                          final record = _careerRecords[index];
                          return GestureDetector(
                            onLongPress: () => _showOptionsSheet(record, index),
                            child: CareerCard(record: record),
                          );
                        },
                      ),
                      CareerBottomActions(
                        label: 'Add more Career',
                        onAdd: () => _showCareerModal(),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
