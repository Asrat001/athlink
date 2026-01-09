import 'package:athlink/features/athlete/profile/presentation/screens/athlete_results_screen.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class AddResultModal extends StatefulWidget {
  final Function(ResultData) onSave;
  final ResultData? initialRecord;

  const AddResultModal({super.key, required this.onSave, this.initialRecord});

  @override
  State<AddResultModal> createState() => _AddResultModalState();
}

class _AddResultModalState extends State<AddResultModal> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController _competitionController;
  late TextEditingController _dateController;
  late TextEditingController _positionController;
  late TextEditingController _totalCompetitorsController;
  late TextEditingController _divisionController;

  @override
  void initState() {
    super.initState();
    _competitionController = TextEditingController(
      text: widget.initialRecord?.competition ?? '',
    );
    _dateController = TextEditingController(
      text: widget.initialRecord?.date ?? '',
    );
    _divisionController = TextEditingController(
      text: widget.initialRecord?.division ?? '',
    );

    String pos = '';
    String total = '';
    if (widget.initialRecord != null) {
      final parts = widget.initialRecord!.position.split('/');
      if (parts.length == 2) {
        pos = parts[0];
        total = parts[1];
      }
    }
    _positionController = TextEditingController(text: pos);
    _totalCompetitorsController = TextEditingController(text: total);
  }

  @override
  void dispose() {
    _competitionController.dispose();
    _dateController.dispose();
    _positionController.dispose();
    _totalCompetitorsController.dispose();
    _divisionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.blue,
              surface: AppColors.darkGreyCard,
            ),
            dialogTheme: DialogThemeData(backgroundColor: AppColors.black),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(
        () => _dateController.text = DateFormat('d/MMM/yyyy').format(picked),
      );
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final positionString =
          "${_positionController.text}/${_totalCompetitorsController.text}";
      final newResult = ResultData(
        date: _dateController.text,
        position: positionString,
        competition: _competitionController.text,
        division: _divisionController.text,
        flagUrl:
            widget.initialRecord?.flagUrl ?? 'https://flagcdn.com/w40/un.png',
      );
      widget.onSave(newResult);
      Navigator.pop(context);
    } else {
      setState(() => _autovalidateMode = AutovalidateMode.onUserInteraction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: widget.initialRecord != null
                    ? 'Edit Result'
                    : 'Add New Result',
                fontSize: 22,
                textColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 25),

              _buildLabel("Competition Name"),
              CustomTextField(
                label: 'Add Competition Name',
                controller: _competitionController,
                borderRadius: 12,
                textColor: AppColors.white,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),

              _buildLabel("Date"),
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: CustomTextField(
                    label: 'Select Date',
                    controller: _dateController,
                    borderRadius: 12,
                    textColor: AppColors.white,

                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildLabel("Position"),
              CustomTextField(
                label: 'e.g., 1',
                controller: _positionController,
                borderRadius: 12,
                textColor: AppColors.white,
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(width: 16),
              _buildLabel("Total Competitors"),
              CustomTextField(
                label: 'e.g., 70',
                controller: _totalCompetitorsController,
                borderRadius: 12,
                textColor: AppColors.white,
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),

              _buildLabel("Division"),
              CustomTextField(
                label: "e.g. Men's Open",
                controller: _divisionController,
                borderRadius: 12,
                textColor: AppColors.white,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: _buildBtn(
                      "Save Result",
                      AppColors.darkGreyCard,
                      _handleSubmit,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildBtn(
                      "Cancel",
                      AppColors.transparent,
                      () => Navigator.pop(context),
                      isBordered: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8, left: 4),
    child: CustomText(
      title: text,
      fontSize: 14,
      textColor: AppColors.white.withValues(alpha: 0.9),
    ),
  );

  Widget _buildBtn(
    String text,
    Color color,
    VoidCallback onTap, {
    bool isBordered = false,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        border: isBordered
            ? Border.all(color: AppColors.white.withValues(alpha: 0.2))
            : null,
      ),
      child: CustomText(
        title: text,
        textColor: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
