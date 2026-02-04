import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AgencyInfo extends StatelessWidget {
  final String location;

  const AgencyInfo({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 14, color: AppColors.grey),
        const SizedBox(width: 4),
        CustomText(
          title: location,
          textColor: AppColors.grey,
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
      ],
    );
  }
}
