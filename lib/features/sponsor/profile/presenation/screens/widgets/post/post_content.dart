import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/post/agency_info.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/info_item.dart';
import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String currency;
  final String duration;
  final String location;
  final bool isDarkMode;
  final VoidCallback onViewDetail;

  const PostContent({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.currency,
    required this.duration,
    required this.location,
    required this.onViewDetail,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostTitle(title: title, isDarkMode: isDarkMode),
          const SizedBox(height: 6),
          PostDescription(description: description, isDarkMode: isDarkMode),
          const SizedBox(height: 12),
          Divider(
            color: isDarkMode ? Colors.white24 : AppColors.divider,
            thickness: 1,
          ),
          const SizedBox(height: 8),
          PriceAndDurationRow(
            price: price,
            currency: currency,
            duration: duration,
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 10),
          Divider(
            color: isDarkMode ? Colors.white24 : AppColors.divider,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          AgencyInfo(location: location, isDarkMode: isDarkMode),
          const SizedBox(height: 18),
          ViewDetailButton(onPressed: onViewDetail),
        ],
      ),
    );
  }
}

class PostTitle extends StatelessWidget {
  final String title;
  final bool isDarkMode;

  const PostTitle({super.key, required this.title, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: title,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      textColor: isDarkMode ? Colors.white : AppColors.black,
    );
  }
}

class PostDescription extends StatelessWidget {
  final String description;
  final bool isDarkMode;

  const PostDescription({
    super.key,
    required this.description,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: description,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      textColor: isDarkMode ? Colors.white70 : AppColors.grey,
    );
  }
}

class PriceAndDurationRow extends StatelessWidget {
  final String price;
  final String currency;
  final String duration;
  final bool isDarkMode;

  const PriceAndDurationRow({
    super.key,
    required this.price,
    required this.currency,
    required this.duration,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          title: price.isNotEmpty
              ? '${AppHelpers.getCurrencySymbol(currency)}$price'
              : 'Not specified',
          fontWeight: FontWeight.w700,
          fontSize: 18,
          textColor: isDarkMode ? Colors.white : AppColors.black,
        ),
        const SizedBox(width: 10),
        VerticalDivider(color: isDarkMode ? Colors.white24 : null),
        const SizedBox(width: 10),
        InfoItem(
          value: duration,
          label: 'months.',
          textColor: isDarkMode ? Colors.white60 : null,
        ),
      ],
    );
  }
}

class ViewDetailButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewDetailButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      height: 50,
      width: double.infinity,
      label: "View Detail",
      onPressed: onPressed,
    );
  }
}
