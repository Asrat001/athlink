import 'dart:io';
import 'package:athlink/features/athlete/profile/domain/models/career_record_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';

class CareerCard extends StatelessWidget {
  final CareerRecord record;
  final bool isSelf;

  const CareerCard({super.key, required this.record, this.isSelf = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.white,
            backgroundImage: record.logoUrl.startsWith('http')
                ? NetworkImage(record.logoUrl) as ImageProvider
                : FileImage(File(record.logoUrl)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        title: record.position,
                        fontSize: 18,
                        textColor: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomText(
                      title: record.duration,
                      fontSize: 12,
                      textColor: AppColors.white.withAlpha((0.6 * 255).round()),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                CustomText(
                  title: record.team,
                  fontSize: 15,
                  textColor: AppColors.white.withAlpha((0.7 * 255).round()),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.white.withAlpha((0.5 * 255).round()),
                    ),
                    const SizedBox(width: 4),
                    CustomText(
                      title: record.location ?? "",
                      fontSize: 12,
                      textColor: AppColors.white.withAlpha((0.5 * 255).round()),
                    ),
                  ],
                ),
                if (record.description.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  CustomText(
                    title: record.description,
                    fontSize: 13,
                    textColor: AppColors.white.withAlpha((0.6 * 255).round()),
                    maxLines: 2,
                  ),
                ],
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    title: isSelf ? 'Edit details' : 'See more',
                    fontSize: 12,
                    textColor: AppColors.orangeGradientEnd,
                    fontWeight: FontWeight.w600,
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

class CareerEmptyState extends StatelessWidget {
  final VoidCallback? onAdd;
  final bool isSelf; 

  const CareerEmptyState({
    super.key,
    this.onAdd,
    this.isSelf = true, 
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/career_icon.svg",
            width: 180,
            height: 180,
            colorFilter: ColorFilter.mode(
              AppColors.white.withAlpha((0.2 * 255).round()),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 24),
          CustomText(
            title: isSelf
                ? 'No Career record yet.'
                : 'No career records found for this athlete.',
            fontSize: 18,
            textColor: AppColors.white.withAlpha((0.38 * 255).round()),
            textAlign: TextAlign.center,
          ),
          if (isSelf && onAdd != null) ...[
            const SizedBox(height: 40),
            CareerBottomActions(
              label: 'Add career Record',
              onAdd: onAdd!,
              showCircle: false,
            ),
          ],
        ],
      ),
    );
  }
}

class CareerBottomActions extends StatelessWidget {
  final String label;
  final VoidCallback onAdd;
  final bool showCircle;

  const CareerBottomActions({
    super.key,
    required this.label,
    required this.onAdd,
    this.showCircle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCircle)
              GestureDetector(
                onTap: onAdd,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withAlpha((0.38 * 255).round()),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white.withAlpha((0.7 * 255).round()),
                    size: 40,
                  ),
                ),
              ),
            GestureDetector(
              onTap: onAdd,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppColors.darkGreyCard,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.white.withAlpha((0.1 * 255).round()),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add, color: AppColors.white, size: 20),
                    const SizedBox(width: 8),
                    CustomText(
                      title: label,
                      textColor: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
