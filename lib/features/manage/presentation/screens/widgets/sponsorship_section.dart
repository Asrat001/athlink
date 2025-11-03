import 'package:athlink/features/manage/presentation/providers/milestone_provider.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/create_milestone_widget.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/milestone_carousel_widget.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SponsorshipSection extends ConsumerStatefulWidget {
  final int activeCount;
  final int closedCount;
  final List<Map<String, dynamic>> sponsorships;

  const SponsorshipSection({
    super.key,
    required this.activeCount,
    required this.closedCount,
    required this.sponsorships,
  });

  @override
  ConsumerState<SponsorshipSection> createState() => _SponsorshipSectionState();
}

class _SponsorshipSectionState extends ConsumerState<SponsorshipSection> {
  @override
  void initState() {
    super.initState();
    // Fetch milestones when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(milestoneProvider.notifier).getMilestones();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _summaryHeader(),
          const SizedBox(height: 24),
          Text(
            "Active Sponsorships",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          widget.sponsorships.isEmpty
              ? SizedBox(
                  width: size.width,
                  height: size.height * 0.30,
                  child: const Center(
                    child: Text(
                      "No Sponsorships Found",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: size.height * 0.30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _buildCard(context, widget.sponsorships[index]),
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemCount: widget.sponsorships.length,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _summaryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Text(
              "Active Sponsorships",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Text(
              "${widget.activeCount}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              "Closed Sponsorships",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Text(
              "${widget.closedCount}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> data) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          barrierColor: AppColors.black.withValues(alpha: .5),
          backgroundColor: Colors.transparent,
          builder: (context) {
            return _detailsModal(context, data);
          },
        );
      },

      child: Container(
        height: 280,
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.grey, // Replaced with AppColors.grey
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(
                alpha: 0.05,
              ), // Using AppColors.black
              offset: const Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                CustomText(
                  title: data['name'],
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.white, // Using AppColors.white
                ),
                const SizedBox(height: 5),
                CustomText(
                  title: data['club'],
                  fontSize: 14,
                  textColor: AppColors.white, // Using AppColors.white
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                const SizedBox(height: 5),
                CustomText(
                  title: 'Age : ${data['age']}',
                  fontSize: 13,
                  textColor: AppColors.white, // Using AppColors.white
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/athlete.png",
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/flag.png",
                  height: 37,
                  width: 37,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              right: 0,
              top: 50,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _iconButton(
                        Icon(
                          Icons.star_border,
                          size: 22,
                          color: AppColors.white,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: -5,
                        child: Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                            color: AppColors.error, // Using AppColors.error
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            data['rating'],
                            style: const TextStyle(
                              color: AppColors.white, // Using AppColors.white
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _iconButton(
                    Icon(
                      Icons.bookmark_border,
                      size: 22,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      // Navigate to milestone modal with athlete/job context
                      final athleteId = data['athleteId'] as String?;
                      final jobId = data['jobId'] as String?;
                      final applicationId = data['applicationId'] as String?;

                      if (athleteId != null &&
                          jobId != null &&
                          applicationId != null &&
                          athleteId.isNotEmpty &&
                          jobId.isNotEmpty &&
                          applicationId.isNotEmpty) {
                        CreateMilestoneModal.show(
                          context,
                          athleteId: athleteId,
                          jobId: jobId,
                          applicationId: applicationId,
                        );
                      }
                    },
                    child: _iconButton(
                      SvgPicture.asset(
                        "assets/images/home.svg",
                        colorFilter: ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsModal(BuildContext context, Map<String, dynamic> data) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      child: ListView(
        // controller: controller,
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "assets/images/athlete.png",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: data['name'],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.black87,
                    ),
                    const SizedBox(height: 2),
                    CustomText(
                      title: data['club'],
                      fontSize: 13,
                      textColor: Colors.black54,
                    ),
                    const SizedBox(height: 2),
                    CustomText(
                      title: "Age : ${data['age']}",
                      fontSize: 12,
                      textColor: Colors.black54,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (i) => const Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "(726)",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ClipOval(
                child: Image.asset(
                  "assets/images/flag.png",
                  height: 42,
                  width: 42,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          // Fetch and display real milestones from API
          Consumer(
            builder: (context, ref, child) {
              final milestoneState = ref.watch(milestoneProvider);

              // Filter milestones for this specific athlete (if needed)
              // For now, showing all sponsor milestones
              final milestonesForAthlete = milestoneState.milestones;

              if (milestonesForAthlete.isNotEmpty) {
                // Convert API milestones to the format expected by MilestoneCarousel
                final milestoneData = milestonesForAthlete.map((milestone) {
                  // Calculate progress based on status
                  double progress = 0.0;
                  String displayStatus = 'Pending';

                  switch (milestone.status.toLowerCase()) {
                    case 'completed':
                      progress = 100.0;
                      displayStatus = 'Finished';
                      break;
                    case 'in_progress':
                      progress = 50.0;
                      displayStatus = 'In Progress';
                      break;
                    case 'accepted':
                      progress = 25.0;
                      displayStatus = 'Accepted';
                      break;
                    default:
                      progress = 0.0;
                      displayStatus = milestone.status;
                  }

                  return {
                    'id': milestone.id,
                    'title': milestone.title,
                    'startDate': _formatDate(milestone.timeline.startDate),
                    'endDate': _formatDate(milestone.timeline.endDate),
                    'description': milestone.description,
                    'checklist': [
                      milestone.paymentStatus == 'released'
                          ? 'Fund Released'
                          : 'Payment ${milestone.paymentStatus}',
                    ],
                    'progress': progress,
                    'status': displayStatus,
                  };
                }).toList();

                return MilestoneCarousel(
                  milestones: milestoneData,
                  athleteId: data['athleteId'] as String?,
                  jobId: data['jobId'] as String?,
                  applicationId: data['applicationId'] as String?,
                );
              } else {
                // Show "Add milestone" button if no milestones exist
                return InkWell(
                  onTap: () {
                    // Get athlete and job IDs from data
                    final athleteId = data['athleteId'] as String?;
                    final jobId = data['jobId'] as String?;
                    final applicationId = data['applicationId'] as String?;

                    if (athleteId != null &&
                        jobId != null &&
                        applicationId != null &&
                        athleteId.isNotEmpty &&
                        jobId.isNotEmpty &&
                        applicationId.isNotEmpty) {
                      CreateMilestoneModal.show(
                        context,
                        athleteId: athleteId,
                        jobId: jobId,
                        applicationId: applicationId,
                      );
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.grey.withValues(alpha: 0.40),
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.insert_drive_file_outlined,
                          size: 30,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Add new milestone",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _iconButton(Widget icon) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.4), // Using AppColors.white
        shape: BoxShape.circle,
      ),
      child: icon, // Using AppColors.white
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
