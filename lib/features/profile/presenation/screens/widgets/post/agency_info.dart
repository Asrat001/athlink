import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AgencyInfo extends StatelessWidget {
  final String agencyName;
  final String location;
  final String? agencyImageUrl;

  const AgencyInfo({
    super.key,
    required this.agencyName,
    required this.location,
    required this.agencyImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AgencyAvatar(agencyImageUrl: agencyImageUrl),
        const SizedBox(width: 10),
        AgencyDetails(agencyName: agencyName, location: location),
        const Spacer(),
      ],
    );
  }
}

class AgencyAvatar extends StatelessWidget {
  final String? agencyImageUrl;

  const AgencyAvatar({super.key, required this.agencyImageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.lightGrey,
                width: 2.0,
              ),
            ),
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: agencyImageUrl != null
                    ? Image.network(
                        UrlHelper.getFullImageUrl(agencyImageUrl!),
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.business,
                            size: 30,
                            color: AppColors.grey,
                          );
                        },
                      )
                    : Icon(
                        Icons.business,
                        size: 30,
                        color: AppColors.grey,
                      ),
              ),
            ),
          ),
          const Positioned(
            bottom: 5,
            child: OnlineIndicator(),
          ),
        ],
      ),
    );
  }
}

class OnlineIndicator extends StatelessWidget {
  const OnlineIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: AppColors.success,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white,
          width: 2.0,
        ),
      ),
    );
  }
}

class AgencyDetails extends StatelessWidget {
  final String agencyName;
  final String location;

  const AgencyDetails({
    super.key,
    required this.agencyName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: agencyName,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          textColor: AppColors.black,
        ),
        const SizedBox(height: 2),
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