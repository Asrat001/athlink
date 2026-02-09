import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:athlink/shared/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/info_tile.dart';

class ResultFullDetailsTab extends StatelessWidget {
  final ResultData result;
  final String? currentLink;
  final Function(String)? onLinkUpdated;
  final bool isSelf;

  const ResultFullDetailsTab({
    super.key,
    required this.result,
    this.currentLink,
    this.onLinkUpdated,
    this.isSelf = true,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if we should even show the "Official Results" section
    // If it's not self and there's no link, we can keep the header but show the empty message
    final hasLink = currentLink != null && currentLink!.isNotEmpty;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
            "POSITION",
            result.position,
            "DATE",
            result.date,
            isDateOrange: true,
          ),
          const SizedBox(height: 40),
          _buildLocationRow(result),
          const SizedBox(height: 60),
          const CustomText(
            title: "Official Results",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textColor: AppColors.orangeGradientStart,
          ),
          const SizedBox(height: 10),

          if (hasLink)
            _buildLinkDisplay(context)
          else
            _buildAddLinkPrompt(context),
        ],
      ),
    );
  }

  Widget _buildLinkDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.link, color: AppColors.orangeGradientStart),
          const SizedBox(width: 12),
          Expanded(
            child: CustomText(
              title: currentLink!,
              fontSize: 14,
              textColor: AppColors.white,
              maxLines: 1,
            ),
          ),
          // Edit button is strictly for the owner
          if (isSelf)
            IconButton(
              icon: const Icon(Icons.edit, size: 18, color: AppColors.white),
              onPressed: () => _showLinkDialog(context),
            ),
        ],
      ),
    );
  }

  Widget _buildAddLinkPrompt(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: isSelf
              ? "Link to the official competition results page."
              : "No official results link provided by the athlete.",
          fontSize: 13,
          textColor: AppColors.white.withValues(alpha: 0.7),
        ),

        if (isSelf) ...[
          const SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () => _showLinkDialog(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.darkGreyCard,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.1),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_link, color: AppColors.white, size: 20),
                    SizedBox(width: 10),
                    CustomText(
                      title: "Add results link",
                      textColor: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _showLinkDialog(BuildContext context) {
    // Safety check: Don't allow dialog to open if not self
    if (!isSelf || onLinkUpdated == null) return;

    final controller = TextEditingController(text: currentLink);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: AppColors.darkGreyCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.orangeGradientStart.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.link,
                    color: AppColors.orangeGradientStart,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                const CustomText(
                  title: "Competition Link",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.white,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  cursorColor: AppColors.white,
                  style: const TextStyle(color: AppColors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: "https://example.com/results",
                    hintStyle: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.2),
                    ),
                    filled: true,
                    fillColor: AppColors.black.withValues(alpha: 0.3),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.white.withValues(alpha: 0.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.orangeGradientStart,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a URL';
                    }
                    // Basic URL validation
                    final urlPattern = RegExp(
                      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
                      caseSensitive: false,
                    );
                    if (!urlPattern.hasMatch(value.trim())) {
                      return 'Please enter a valid URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: CustomText(
                          title: "Cancel",
                          textColor: AppColors.white.withValues(alpha: 0.5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orangeGradientStart,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            onLinkUpdated!(controller.text.trim());
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Save"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(
    String l1,
    String v1,
    String l2,
    String v2, {
    bool isDateOrange = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: InfoTile(label: l1, value: v1),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InfoTile(
            label: l2,
            value: DateFormatter.formatFromISO(v2),
            isOrange: isDateOrange,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationRow(ResultData result) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: "LOCATION",
                fontSize: 12,
                textColor: AppColors.white.withValues(alpha: 0.38),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(2),
                  //   child: Image.network(
                  //     result.flagUrl,
                  //     width: 24,
                  //     height: 16,
                  //     fit: BoxFit.cover,
                  //     errorBuilder: (context, error, stackTrace) =>
                  //         const Icon(Icons.flag, size: 16, color: Colors.grey),
                  //   ),
                  // ),
                  // const SizedBox(width: 8),
                  Expanded(
                    child: CustomText(
                      title: result.location,
                      fontSize: 14,
                      textColor: AppColors.orangeGradientStart,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InfoTile(
            label: "DIVISION",
            value: result.division,
            isOrange: true,
          ),
        ),
      ],
    );
  }
}
