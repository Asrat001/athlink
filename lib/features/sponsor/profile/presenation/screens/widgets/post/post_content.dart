import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/post/agency_info.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/info_item.dart';
import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String duration;
  final String agencyName;
  final String location;
  final String? agencyImageUrl;

  const PostContent({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.duration,
    required this.agencyName,
    required this.location,
    required this.agencyImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostTitle(title: title),
          const SizedBox(height: 6),
          PostDescription(description: description),
          const SizedBox(height: 12),
          const Divider(color: AppColors.divider, thickness: 1),
          const SizedBox(height: 8),
          PriceAndDurationRow(price: price, duration: duration),
          const SizedBox(height: 10),
          const Divider(color: AppColors.divider, thickness: 1),
          const SizedBox(height: 10),
          AgencyInfo(
            agencyName: agencyName,
            location: location,
            agencyImageUrl: agencyImageUrl,
          ),
          const SizedBox(height: 18),
          const ViewDetailButton(),
        ],
      ),
    );
  }
}

class PostTitle extends StatelessWidget {
  final String title;

  const PostTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: title,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      textColor: AppColors.black,
    );
  }
}

class PostDescription extends StatelessWidget {
  final String description;

  const PostDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: description,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      textColor: AppColors.grey,
    );
  }
}

class PriceAndDurationRow extends StatelessWidget {
  final String price;
  final String duration;

  const PriceAndDurationRow({
    super.key,
    required this.price,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InfoItem(value: price, label: '\$/m'),
        const SizedBox(width: 10),
        const VerticalDivider(),
        const SizedBox(width: 10),
        InfoItem(value: duration, label: 'months.'),
      ],
    );
  }
}

class ViewDetailButton extends StatelessWidget {
  const ViewDetailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      height: 50,
      width: double.infinity,
      label: "View Detail",
      onPressed: () {},
    );
  }
}
