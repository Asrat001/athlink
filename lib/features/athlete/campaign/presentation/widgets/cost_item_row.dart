import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';

class CostItemRow extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final VoidCallback onRemove;
  final ValueChanged<String> onChanged;

  const CostItemRow({
    super.key,
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
        Expanded(
          flex: 3,
          child: _buildField(
            "Title",
            "eg. Training",
            titleController,
            TextInputType.text,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: _buildField(
            "Amount",
            "eg. 200",
            amountController,
            TextInputType.number,
          ),
        ),
        IconButton(
          onPressed: onRemove,
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.white60,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildField(
    String label,
    String hint,
    TextEditingController controller,
    TextInputType type,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: label, fontSize: 12, textColor: AppColors.grey),
        const SizedBox(height: 8),
        TextFormField(
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
              borderSide: const BorderSide(
                color: AppColors.orangeGradientStart,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
