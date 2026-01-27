import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddGoalBottomSheet extends StatefulWidget {
  final Future<void> Function(GoalMilestone)? onSave;
  const AddGoalBottomSheet({super.key, this.onSave});

  @override
  State<AddGoalBottomSheet> createState() => _AddGoalBottomSheetState();
}

class _AddGoalBottomSheetState extends State<AddGoalBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  String _status = "incoming";
  DateTime? _selectedDate;
  bool _isLoading = false;
  String? _errorMessage;

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
      child: IgnorePointer(
        ignoring: _isLoading,
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    label: "Title",
                    controller: _titleController,
                    textColor: AppColors.white,
                    validator: (val) =>
                        (val == null || val.isEmpty) ? "Required" : null,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
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
                    _dateController.text = DateFormat(
                      'dd/MM/yyyy',
                    ).format(date);
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
            DropdownButtonFormField<String>(
              value: _status,
              dropdownColor: AppColors.darkGreyCard,
              style: GoogleFonts.inter(color: AppColors.white),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.grey,
              ),
              decoration: InputDecoration(
                labelText: "Status",
                labelStyle: GoogleFonts.inter(
                  color: AppColors.grey,
                  fontSize: 12,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
                filled: false,
              ),
              items:
                  [
                        {"label": "Incoming", "value": "incoming"},
                        {"label": "In Progress", "value": "inprogress"},
                        {"label": "Completed", "value": "completed"},
                      ]
                      .map(
                        (s) => DropdownMenuItem(
                          value: s["value"],
                          child: Text(s["label"]!),
                        ),
                      )
                      .toList(),
              onChanged: (v) => setState(() => _status = v!),
            ),
            const SizedBox(height: 32),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: CustomText(
                    title: _errorMessage!,
                    fontSize: 13,
                    textColor: AppColors.error,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
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
                    label: _isLoading ? "" : "Add",
                    icon: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                    backgroundColor:
                        AppColors.primary, // Using primary for visibility
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          _selectedDate != null) {
                        final goal = GoalMilestone(
                          title: _titleController.text,
                          date: _selectedDate!,
                          status: _status,
                        );

                        if (widget.onSave != null) {
                          setState(() {
                            _isLoading = true;
                            _errorMessage = null;
                          });
                          try {
                            await widget.onSave!(goal);
                          } catch (e) {
                            if (mounted) {
                              setState(() => _errorMessage = e.toString());
                            }
                          } finally {
                            if (mounted) setState(() => _isLoading = false);
                          }
                        } else {
                          Navigator.pop(context, goal);
                        }
                      } else if (_selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please select a date",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: AppColors.error,
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
      ),
    );
  }
}
