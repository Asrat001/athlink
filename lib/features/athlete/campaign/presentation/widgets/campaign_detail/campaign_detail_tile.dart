import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CampaignDetailTile extends StatelessWidget {
  final String title;
  final String desc;
  final String btnLabel;
  final bool isExpanded;
  final ValueChanged<bool> onToggle;
  final VoidCallback onAction;
  final Widget? content;

  const CampaignDetailTile({
    super.key,
    required this.title,
    required this.desc,
    required this.btnLabel,
    required this.isExpanded,
    required this.onToggle,
    required this.onAction,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => onToggle(!isExpanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...[
          if (content != null) content!,
          Text(
            desc,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onAction,
            icon: const Icon(Icons.add, size: 18),
            label: Text(btnLabel),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surface.withOpacity(0.5),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        const Divider(color: AppColors.border),
      ],
    );
  }
}
