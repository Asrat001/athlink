import 'dart:io';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record_ui.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/career_journey_provider.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/career_journey_state.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/career_widget.dart';
import 'package:athlink/shared/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/add_career_modal.dart';

class CareerJourneyScreen extends ConsumerStatefulWidget {
  final String? athleteId;
  final bool isSelf;

  const CareerJourneyScreen({super.key, this.athleteId, this.isSelf = true});

  @override
  ConsumerState<CareerJourneyScreen> createState() =>
      _CareerJourneyScreenState();
}

class _CareerJourneyScreenState extends ConsumerState<CareerJourneyScreen> {
  @override
  void initState() {
    logger("career screen ${widget.isSelf}");
    super.initState();
    _fetchJourney();
  }

  void _fetchJourney() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localStorage = sl<LocalStorageService>();
      final loggedInUser = localStorage.getUserData();

      // Determine whose data to fetch
      final targetId = widget.isSelf ? loggedInUser?.id : widget.athleteId;

      if (targetId != null) {
        ref
            .read(careerJourneyProvider(targetId).notifier)
            .loadCareerJourney(targetId);
      }
    });
  }

  void _showCareerModal({CareerJourneyModel? record}) {
    if (!widget.isSelf) return;

    final localStorage = sl<LocalStorageService>();
    final user = localStorage.getUserData();
    if (user == null) {
      debugPrint("User is null, cannot edit");
      return;
    }
    debugPrint("Opening edit modal for ${record?.id}");

    final uiRecord = record != null
        ? CareerRecord(
            logoUrl: record.logo ?? '',
            position: record.position,
            team: record.teamName,
            location: record.location ?? '',
            duration: record.year,
            achievements: record.achievements,
            description: record.description,
          )
        : null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.black.withAlpha((0.8 * 255).round()),
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
          File? logoFile;
          // Check if logoUrl is a local file (not http) and different from existing/default
          if (newRecord.logoUrl.isNotEmpty &&
              !newRecord.logoUrl.startsWith('http')) {
            bool isSameAsOld =
                record != null && newRecord.logoUrl == record.logo;
            if (!isSameAsOld) {
              logoFile = File(newRecord.logoUrl);
            }
          }

          if (record != null) {
            ref
                .read(careerJourneyProvider(user.id).notifier)
                .updateCareer(
                  athleteId: user.id,
                  careerId: record.id,
                  data: data,
                  logo: logoFile,
                  onSuccess: () => Navigator.pop(context),
                );
          } else {
            ref
                .read(careerJourneyProvider(user.id).notifier)
                .createCareer(
                  athleteId: user.id,
                  data: data,
                  logo: logoFile,
                  onSuccess: () => Navigator.pop(context),
                );
          }
        },
      ),
    );
  }

  void _showOptionsSheet(CareerJourneyModel record) {
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
                color: AppColors.white.withAlpha((0.1 * 255).round()),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined, color: AppColors.white),
              title: const CustomText(
                title: 'Edit Journey',
                textColor: AppColors.white,
              ),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (mounted) {
                    _showCareerModal(record: record);
                  }
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.red),
              title: const CustomText(
                title: 'Delete Record',
                textColor: AppColors.red,
              ),
              onTap: () => Navigator.pop(context), // Add Delete API call here
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localStorage = sl<LocalStorageService>();
    final loggedInUser = localStorage.getUserData();
    final targetId = widget.isSelf ? loggedInUser?.id : widget.athleteId;

    if (targetId == null)
      return const Scaffold(body: Center(child: Text("Not found")));

    final state = ref.watch(careerJourneyProvider(targetId));

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
          child: CustomText(title: message, textColor: Colors.white),
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
                  title: widget.isSelf
                      ? 'Your complete work records appear here.'
                      : 'Professional career timeline and records.',
                  fontSize: 15,
                  textColor: AppColors.white.withAlpha((0.7 * 255).round()),
                ),
              ),
              Expanded(
                child: careers.isEmpty
                    ? CareerEmptyState(
                        isSelf: widget.isSelf,
                        onAdd: () => _showCareerModal(),
                      )
                    : Stack(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              20,
                              10,
                              20,
                              widget.isSelf ? 150 : 20,
                            ),
                            itemCount: careers.length,
                            itemBuilder: (context, index) {
                              final record = careers[index];
                              return GestureDetector(
                                onLongPress: widget.isSelf
                                    ? () => _showOptionsSheet(record)
                                    : null,
                                child: CareerCard(
                                  isSelf: widget.isSelf,
                                  record: CareerRecord(
                                    logoUrl: record.logo ?? '',
                                    position: record.position,
                                    team: record.teamName,
                                    location:
                                        record.location != null &&
                                            record.location!.isNotEmpty
                                        ? record.location!.split('*').first
                                        : "",
                                    duration: record.year,
                                    achievements: record.achievements,
                                    description: record.description,
                                  ),
                                ),
                              );
                            },
                          ),
                          if (widget.isSelf)
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
