import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandAmbasadorDetailView extends ConsumerWidget {
  const BrandAmbasadorDetailView({super.key,required this.selectedJobIndex,required this.onJobBack});
final int ?selectedJobIndex;
final VoidCallback onJobBack;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final jobListState = ref.watch(jobListProvider);
    final job = jobListState.jobPosts[selectedJobIndex ?? 0];

    return SingleChildScrollView(
      key: const ValueKey('ba_detail_view'),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/on1.jpg"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: jobListState.companyName??"Company Name",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      CustomText(
                        title: job.location,
                        fontSize: 14,
                        textColor: AppColors.grey,
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: onJobBack,
                  child: const Icon(Icons.arrow_back, color: AppColors.black),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 20),

            // Title
            CustomText(
              title: job.title,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              textColor: AppColors.black,
            ),
            const SizedBox(height: 12),

            // Description paragraph (matching the screenshot spacing)
            CustomText(
              title: job.description ,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              textColor: AppColors.grey,
            ),
            const SizedBox(height: 18),

            // Payment & timeline row (pixel aligned)
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: CustomText(
                    title: 'Payment',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                CustomText(
                  title: job.price.toString().replaceAll('/m', ''),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.grey,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: CustomText(
                    title: 'Time line',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                CustomText(
                  title: '6 months',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.grey,
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}