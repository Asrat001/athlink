import 'dart:io';
import 'package:athlink/features/athlete/profile/domain/models/career_record_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/constant/constants.dart';

class CareerCard extends StatefulWidget {
  final CareerRecord record;
  final bool isSelf;

  const CareerCard({super.key, required this.record, this.isSelf = true});

  @override
  State<CareerCard> createState() => _CareerCardState();
}

class _CareerCardState extends State<CareerCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool hasLongDescription = widget.record.description.length > 50;
    final bool shouldShowButton = hasLongDescription;

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
            backgroundImage: widget.record.logoUrl.startsWith('http')
                ? NetworkImage(widget.record.logoUrl) as ImageProvider
                : widget.record.logoUrl.startsWith('/') ||
                      !File(widget.record.logoUrl).existsSync()
                ? NetworkImage('$fileBaseUrl${widget.record.logoUrl}')
                : FileImage(File(widget.record.logoUrl)),
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
                        title: widget.record.position,
                        fontSize: 18,
                        textColor: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomText(
                      title: widget.record.duration,
                      fontSize: 12,
                      textColor: AppColors.white.withAlpha((0.6 * 255).round()),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                CustomText(
                  title: widget.record.team,
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
                      title: widget.record.location ?? "",
                      fontSize: 12,
                      textColor: AppColors.white.withAlpha((0.5 * 255).round()),
                    ),
                  ],
                ),
                if (widget.record.description.isNotEmpty) ...{
                  const SizedBox(height: 10),
                  CustomText(
                    title: widget.record.description,
                    fontSize: 13,
                    textColor: AppColors.white.withAlpha((0.6 * 255).round()),
                    maxLines: _isExpanded ? null : 2,
                  ),
                  if (shouldShowButton) ...[
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: CustomText(
                        title: _isExpanded ? 'Show less' : 'Show more',
                        fontSize: 12,
                        textColor: AppColors.orangeGradientEnd,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                },
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

  const CareerEmptyState({super.key, this.onAdd, this.isSelf = true});

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
            CareerBottomActions(label: 'Add career Record', onAdd: onAdd!),
          ],
        ],
      ),
    );
  }
}

class CareerBottomActions extends StatelessWidget {
  final String label;
  final VoidCallback onAdd;

  const CareerBottomActions({
    super.key,
    required this.label,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: GestureDetector(
          onTap: onAdd,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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
      ),
    );
  }
}
