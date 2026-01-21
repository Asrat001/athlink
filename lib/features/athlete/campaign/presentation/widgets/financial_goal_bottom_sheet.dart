import 'package:athlink/shared/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:intl/intl.dart';

class FinancialGoalBottomSheet extends StatefulWidget {
  const FinancialGoalBottomSheet({super.key});

  @override
  State<FinancialGoalBottomSheet> createState() =>
      _FinancialGoalBottomSheetState();
}

class _FinancialGoalBottomSheetState extends State<FinancialGoalBottomSheet> {
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    logger('_selectDate called');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.orangeGradientStart,
              onPrimary: Colors.white,
              surface: AppColors.darkGreyCard,
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.orangeGradientStart,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              title: "Add Financial Goal",
              fontSize: 20,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 32),

            const CustomText(
              title: "Total amount",
              textColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 8),

            // Amount Input Field
            _buildInputField(
              controller: _amountController,
              hint: "Add how much total money the campaign needs.",
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? "Amount is required" : null,
            ),

            const SizedBox(height: 24),

            const CustomText(
              title: "Date",
              textColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 8),

            // Custom Date Picker Field (Manual implementation)
            GestureDetector(
              onTap: () => _selectDate(context),
              child: _buildInputField(
                controller: _dateController,
                hint: "Add the deadline",
                enabled: false, // Disables keyboard focus
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: AppColors.grey,
                  size: 18,
                ),
                validator: (value) =>
                    value!.isEmpty ? "Deadline is required" : null,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                Expanded(
                  child: RoundedButton(
                    label: "Cancel",
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: Colors.transparent,
                    borderSide: const BorderSide(color: Colors.white24),
                    foregroundColor: AppColors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: RoundedButton(
                    label: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    backgroundColor: AppColors.darkGreyCard,
                    foregroundColor: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable custom field builder to maintain consistency with your UI
  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    bool enabled = true,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.grey, fontSize: 14),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        // Match the border style from your uploaded images
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2C2C2C)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2C2C2C)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.orangeGradientStart),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
