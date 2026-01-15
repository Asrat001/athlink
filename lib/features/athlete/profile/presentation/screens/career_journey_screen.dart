import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record_ui.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/career_journey_provider.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/career_journey_state.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/career_widget.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/add_career_modal.dart';

class CareerJourneyScreen extends ConsumerStatefulWidget {
  const CareerJourneyScreen({super.key});

  @override
  ConsumerState<CareerJourneyScreen> createState() =>
      _CareerJourneyScreenState();
}

class _CareerJourneyScreenState extends ConsumerState<CareerJourneyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localStorage = sl<LocalStorageService>();
      final user = localStorage.getUserData();
      if (user != null) {
        ref.read(careerJourneyProvider.notifier).loadCareerJourney(user.id);
      }
    });
  }

  void _showCareerModal({CareerJourneyModel? record}) {
    final localStorage = sl<LocalStorageService>();
    final user = localStorage.getUserData();
    if (user == null) return;

    // Convert API model to UI model for the modal
    final uiRecord = record != null
        ? CareerRecord(
            logoUrl: record.logo ?? '',
            position: record.position,
            team: record.teamName,
            location: '',
            duration: record.year,
            achievements: record.achievements,
            description: record.description,
          )
        : null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.black.withValues(alpha: 0.8),
      builder: (context) => AddCareerModal(
        initialRecord: uiRecord,
        onSave: (newRecord) {
          final data = {
            'position': newRecord.position,
            'teamName': newRecord.team,
            'year': newRecord.duration,
            'achievements': newRecord.achievements,
            'description': newRecord.description,
            'location': newRecord.location,
          };
          if (record != null) {
            ref
                .read(careerJourneyProvider.notifier)
                .updateCareer(
                  athleteId: user.id,
                  careerId: record.id,
                  data: data,
                  logo: null,
                  onSuccess: () {
                    if (mounted) Navigator.pop(context);
                  },
                );
          } else {
            ref
                .read(careerJourneyProvider.notifier)
                .createCareer(
                  athleteId: user.id,
                  data: data,
                  logo: null,
                  onSuccess: () {
                    if (mounted) Navigator.pop(context);
                  },
                );
          }
        },
      ),
    );
  }

  void _showOptionsSheet(CareerJourneyModel record) {
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
                title: 'Edit Journey',
                textColor: AppColors.white,
                fontSize: 16,
              ),
              onTap: () {
                Navigator.pop(context);
                _showCareerModal(record: record);
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
                // TODO: Implement delete API call
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
    final state = ref.watch(careerJourneyProvider);

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
          title: 'Career Journey',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: AppColors.red, size: 48),
              const SizedBox(height: 16),
              CustomText(
                title: message,
                textColor: AppColors.white,
                fontSize: 16,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final localStorage = sl<LocalStorageService>();
                  final user = localStorage.getUserData();
                  if (user != null) {
                    ref
                        .read(careerJourneyProvider.notifier)
                        .loadCareerJourney(user.id);
                  }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        loaded: (data) {
          final careers = data.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CustomText(
                  title: 'Your complete work records appear here.',
                  fontSize: 15,
                  textColor: AppColors.white.withValues(alpha: 0.7),
                ),
              ),
              Expanded(
                child: careers.isEmpty
                    ? CareerEmptyState(onAdd: () => _showCareerModal())
                    : Stack(
                        children: [
                          ListView.builder(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 150),
                            itemCount: careers.length,
                            itemBuilder: (context, index) {
                              final record = careers[index];
                              return GestureDetector(
                                onLongPress: () => _showOptionsSheet(record),
                                child: CareerCard(
                                  record: CareerRecord(
                                    logoUrl: record.logo ?? '',
                                    position: record.position,
                                    team: record.teamName,
                                    location:
                                        record.location != null &&
                                            record.location!.isNotEmpty
                                        ? record.location!.split(',')[2]
                                        : "",
                                    duration: record.year,
                                    achievements: record.achievements,
                                    description: record.description,
                                  ),
                                ),
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
          );
        },
      ),
    );
  }
}
