import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';

class CreateMilestoneModal extends StatefulWidget {
  const CreateMilestoneModal({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      barrierColor: AppColors.transparent,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CreateMilestoneModal(),
    );
  }

  @override
  State<CreateMilestoneModal> createState() => _CreateMilestoneModalState();
}

class _CreateMilestoneModalState extends State<CreateMilestoneModal> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _fundController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _pickDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewInsets;

    return Padding(
      padding: EdgeInsets.only(bottom: padding.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.extraLightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 16),

                /// Header
                const CustomText(
                  title: "Create a milestone",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.black,
                ),
                const SizedBox(height: 8),
                const CustomText(
                  title:
                      "Break your job post in to clear phases to track progress and release funds efficiently",
                  fontSize: 13,
                  textColor: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                ),
                const SizedBox(height: 24),

                /// Milestone title
                Row(children: [_buildLabel("Milestone Title")]),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _titleController,
                  hintText: "Eg. Brand promotion launch",
                ),
                const SizedBox(height: 16),

                /// Description
                Row(children: [_buildLabel("Description / Deliverables")]),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _descController,
                  hintText: "Define what the athlete must complete.",
                  maxLines: 3,
                  maxLength: 200,
                ),
                const SizedBox(height: 16),

                /// Timeline
                Row(children: [_buildLabel("Timeline")]),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: _buildDateField(
                        label: _startDate == null
                            ? "Start Date"
                            : "${_startDate!.day}/${_startDate!.month}/${_startDate!.year}",
                        onTap: () => _pickDate(isStart: true),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDateField(
                        label: _endDate == null
                            ? "End Date"
                            : "${_endDate!.day}/${_endDate!.month}/${_endDate!.year}",
                        onTap: () => _pickDate(isStart: false),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(children: [_buildLabel("Fund Amount")]),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _fundController,
                  hintText: "................ USD",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 28),

                /// Buttons
                RoundedButton(
                  label: "Done",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  borderRadius: 15,
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  height: 48,
                ),
                const SizedBox(height: 12),
                RoundedButton(
                  label: "Cancel",
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: AppColors.transparent,
                  foregroundColor: AppColors.black,
                  borderRadius: 15,
                  borderSide: BorderSide(width: 1, color: AppColors.black),
                  height: 48,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return CustomText(
      title: text,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      textColor: AppColors.textPrimary,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int? maxLines,
    int? maxLength,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.extraLightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.extraLightGrey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Required field' : null,
    );
  }

  Widget _buildDateField({required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.extraLightGrey),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomText(
          title: label,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textColor: label.contains('/') ? AppColors.black : AppColors.grey,
        ),
      ),
    );
  }
}
