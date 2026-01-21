import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CostItemRow extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final VoidCallback onRemove;
  final ValueChanged<String> onChanged;

  const CostItemRow({
    required this.titleController,
    required this.amountController,
    required this.onRemove,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Title Field
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                title: "Title",
                fontSize: 12,
                textColor: AppColors.grey,
              ),
              const SizedBox(height: 8),
              _buildSimpleField(
                titleController,
                "eg. Training & Coaching",
                TextInputType.text,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Amount Field
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                title: "Amount",
                fontSize: 12,
                textColor: AppColors.grey,
              ),
              const SizedBox(height: 8),
              _buildSimpleField(
                amountController,
                "eg. \$200,000",
                TextInputType.number,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Remove Icon
        IconButton(
          onPressed: onRemove,
          icon: const Icon(Icons.remove, color: Colors.white60),
        ),
      ],
    );
  }

  Widget _buildSimpleField(
    TextEditingController controller,
    String hint,
    TextInputType type,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 12),
        filled: true,
        fillColor: const Color(0xFF121212),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.orangeGradientStart),
        ),
      ),
    );
  }
}
