import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/create_milestone_widget.dart';

class MilestoneCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> milestones;

  const MilestoneCarousel({super.key, required this.milestones});

  @override
  State<MilestoneCarousel> createState() => _MilestoneCarouselState();
}

class _MilestoneCarouselState extends State<MilestoneCarousel> {
  int _currentIndex = 0;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final milestonesWithAdd = [
      ...widget.milestones,
      {'isAddCard': true},
    ];

    return Column(
      children: [
        SizedBox(
          height: 360,
          child: PageView.builder(
            padEnds: false,
            controller: _controller,
            itemCount: milestonesWithAdd.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final data = milestonesWithAdd[index];
              if (data['isAddCard'] == true) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildAddCard(context),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildMilestoneCard(data),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            milestonesWithAdd.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 10,
              width: _currentIndex == index ? 12 : 8,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? AppColors.black
                    : AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMilestoneCard(Map<String, dynamic> data) {
    final double progress = data['progress'] ?? 0.0;
    final String status = data['status'] ?? "In Progress";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const CustomText(
                title: "Milestone Tracker",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textColor: AppColors.black,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: status == "Finished"
                      ? AppColors.lightGreen.withOpacity(0.2)
                      : AppColors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: status == "Finished"
                        ? AppColors.success
                        : AppColors.amber,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Number and Title
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.lightBlue,
                  child: Text(
                    data['id'].toString(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${data['startDate']} - ${data['endDate']}",
                  style: TextStyle(color: AppColors.grey, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Description
          Text(
            data['description'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 13.5,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          // Checklist
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              (data['checklist'] as List).length,
              (i) => Row(
                children: [
                  const Icon(
                    Icons.check_box,
                    color: AppColors.lightBlue,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    data['checklist'][i],
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Progress bar
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress / 100,
                minHeight: 6,
                backgroundColor: AppColors.extraLightGrey,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightBlue),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${progress.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.lightBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCard(BuildContext context) {
    return InkWell(
      onTap: () => CreateMilestoneModal.show(context),
      borderRadius: BorderRadius.circular(25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.grey.withOpacity(0.40),
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
            Text(
              "Add new milestone",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
