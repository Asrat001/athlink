import 'package:athlink/features/athlete/campaign/presentation/widgets/cost_item_row.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';

class CostBreakdownBottomSheet extends StatefulWidget {
  final double totalBudget;

  const CostBreakdownBottomSheet({super.key, required this.totalBudget});

  @override
  State<CostBreakdownBottomSheet> createState() =>
      _CostBreakdownBottomSheetState();
}

class _CostBreakdownBottomSheetState extends State<CostBreakdownBottomSheet> {
  // Each entry is a map containing controllers for that specific row
  final List<Map<String, TextEditingController>> _costItems = [];

  @override
  void initState() {
    super.initState();
    _addNewRow(); // Start with one empty row as per image image_ba1a75.png
  }

  void _addNewRow() {
    setState(() {
      _costItems.add({
        'title': TextEditingController(),
        'amount': TextEditingController(),
      });
    });
  }

  void _removeRow(int index) {
    if (_costItems.length > 1) {
      setState(() {
        _costItems[index]['title']!.dispose();
        _costItems[index]['amount']!.dispose();
        _costItems.removeAt(index);
      });
    }
  }

  double _calculateRemaining() {
    double spent = 0;
    for (var item in _costItems) {
      spent += double.tryParse(item['amount']!.text) ?? 0;
    }
    return widget.totalBudget - spent;
  }

  @override
  void dispose() {
    for (var item in _costItems) {
      item['title']!.dispose();
      item['amount']!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double remaining = _calculateRemaining();

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: "Cost Breakdown",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 8),
          const CustomText(
            title: "Can you break down how the funds will be allocated?",
            textColor: AppColors.grey,
          ),

          const SizedBox(height: 32),

          // Budget Display Section
          _buildBudgetSummary(widget.totalBudget, remaining),

          const SizedBox(height: 24),

          // Dynamic List of Cost Items
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _costItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return CostItemRow(
                  titleController: _costItems[index]['title']!,
                  amountController: _costItems[index]['amount']!,
                  onRemove: () => _removeRow(index),
                  onChanged: (_) => setState(() {}),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Add Row Button
          Center(
            child: InkWell(
              onTap: _addNewRow,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.darkGreyCard,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 18),
                    SizedBox(width: 4),
                    CustomText(title: "Add", fontSize: 14),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Footer Buttons
          Row(
            children: [
              Expanded(
                child: RoundedButton(
                  label: "Cancel",
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: Colors.transparent,
                  borderSide: const BorderSide(color: Colors.white24),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: RoundedButton(
                  label: "Save",
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: AppColors.darkGreyCard,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetSummary(double total, double remaining) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: "Total Budget : ${total.toStringAsFixed(0)}",
                fontSize: 12,
                textColor: AppColors.grey,
              ),
              const SizedBox(height: 8),
              CustomText(
                title: "Remaining : ${remaining.toStringAsFixed(0)}",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          // Circular progress visual matching image_ba1a75.png
          SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              value: remaining / total,
              backgroundColor: Colors.white12,
              color: AppColors.orangeGradientStart,
              strokeWidth: 4,
            ),
          ),
        ],
      ),
    );
  }
}
