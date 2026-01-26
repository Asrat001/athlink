import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddGoalBottomSheet extends StatefulWidget {
  const AddGoalBottomSheet({super.key});

  @override
  State<AddGoalBottomSheet> createState() => _AddGoalBottomSheetState();
}

class _AddGoalBottomSheetState extends State<AddGoalBottomSheet> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _statusController = TextEditingController(text: "Started");
  DateTime? _selectedDate;

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
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: "Add new goal milestone",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textColor: AppColors.white,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            label: "Title",
            controller: _titleController,
            textColor: AppColors.white,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );
              if (date != null) {
                setState(() {
                  _selectedDate = date;
                  _dateController.text = DateFormat('dd/MM/yyyy').format(date);
                });
              }
            },
            child: AbsorbPointer(
              child: CustomTextField(
                label: "Date",
                controller: _dateController,
                textColor: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: "Status",
            controller: _statusController,
            textColor: AppColors.white,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: RoundedButton(
                  label: "Cancel",
                  backgroundColor: Colors.transparent,
                  borderSide: const BorderSide(color: Colors.white12),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RoundedButton(
                  label: "Save",
                  backgroundColor: AppColors.darkGreyCard,
                  onPressed: () {
                    if (_titleController.text.isNotEmpty &&
                        _selectedDate != null) {
                      Navigator.pop(
                        context,
                        GoalMilestone(
                          title: _titleController.text,
                          date: _selectedDate!,
                          status: _statusController.text,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
