import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalTimelineSummary extends StatelessWidget {
  final List<GoalMilestone> milestones;
  final VoidCallback onAdd;

  const GoalTimelineSummary({required this.milestones, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: milestones.length,
          itemBuilder: (context, index) {
            return IntrinsicHeight(
              child: Row(
                children: [
                  // Vertical Timeline Line
                  Column(
                    children: [
                      _buildIndicator(index),
                      if (index != milestones.length - 1 || true)
                        Expanded(
                          child: Container(
                            width: 1,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: CustomPaint(painter: DashedLinePainter()),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Milestone Card
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(50), // Pill shape
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: milestones[index].title,
                                  textColor: AppColors.white,
                                  fontSize: 16,
                                ),
                                CustomText(
                                  title:
                                      "Target Date: ${DateFormat('dd /MM /yyyy').format(milestones[index].date)}",
                                  textColor: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                          _buildStatusChip(milestones[index].status),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        // Add New Goal Milestone Pill
        GestureDetector(
          onTap: onAdd,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24),
                ),
                child: const Icon(Icons.add, color: Colors.orange, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: const CustomText(
                    title: "Add new goal milestone",
                    textColor: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildIndicator(int index) {
    // Example: first is checked, second is percentage, third is trophy
    if (index == 0)
      return const Icon(Icons.check_circle, color: Colors.orange, size: 30);
    if (index == 1) return _buildPercentageIndicator("40%");
    return const Icon(
      Icons.emoji_events_outlined,
      color: Colors.orange,
      size: 30,
    );
  }

  Widget _buildPercentageIndicator(String text) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Center(
        child: CustomText(title: text, fontSize: 8, textColor: Colors.orange),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status == "In Progress"
            ? Colors.green.withOpacity(0.2)
            : Colors.yellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomText(
        title: status,
        fontSize: 12,
        textColor: status == "In Progress" ? Colors.green : Colors.yellow[700],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
