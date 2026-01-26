import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:athlink/shared/theme/app_colors.dart';

class FinancialGoalBottomSheet extends StatefulWidget {
  final FinancialGoalData? initialGoal;
  const FinancialGoalBottomSheet({super.key, this.initialGoal});

  @override
  State<FinancialGoalBottomSheet> createState() =>
      _FinancialGoalBottomSheetState();
}

class _FinancialGoalBottomSheetState extends State<FinancialGoalBottomSheet> {
  final _amountCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialGoal != null) {
      _amountCtrl.text = widget.initialGoal!.amount.toInt().toString();
      _selectedDate = widget.initialGoal!.deadline;
      _dateCtrl.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
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
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Financial Goal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            "Total amount",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          _buildField(
            "Add how much total money the campaign needs.",
            _amountCtrl,
            isNum: true,
          ),
          const SizedBox(height: 20),
          const Text(
            "Date",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          _buildDateField(),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _ActionBtn(
                  label: "Cancel",
                  isOutlined: true,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionBtn(
                  label: "Save",
                  isOutlined: false,
                  onTap: () {
                    if (_amountCtrl.text.isNotEmpty && _selectedDate != null) {
                      Navigator.pop(
                        context,
                        FinancialGoalData(
                          amount: double.parse(_amountCtrl.text),
                          deadline: _selectedDate!,
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

  Widget _buildField(
    String hint,
    TextEditingController ctrl, {
    bool isNum = false,
  }) {
    return TextField(
      controller: ctrl,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
        filled: true,
        fillColor: const Color(0xFF121212),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return TextField(
      controller: _dateCtrl,
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        );
        if (picked != null) {
          setState(() {
            _selectedDate = picked;
            _dateCtrl.text = DateFormat('yyyy-MM-dd').format(picked);
          });
        }
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Add the deadline",
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
        filled: true,
        fillColor: const Color(0xFF121212),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String label;
  final bool isOutlined;
  final VoidCallback onTap;
  const _ActionBtn({
    required this.label,
    required this.isOutlined,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: isOutlined
                ? const BorderSide(color: AppColors.border)
                : BorderSide.none,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
