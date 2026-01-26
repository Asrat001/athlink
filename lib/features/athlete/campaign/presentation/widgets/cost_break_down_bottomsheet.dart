import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_theme.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';

class CostBreakdownBottomSheet extends StatefulWidget {
  final double totalBudget;
  final List<CostItem> initialItems;

  const CostBreakdownBottomSheet({
    super.key,
    required this.totalBudget,
    this.initialItems = const [],
  });

  @override
  State<CostBreakdownBottomSheet> createState() =>
      _CostBreakdownBottomSheetState();
}

class _CostBreakdownBottomSheetState extends State<CostBreakdownBottomSheet> {
  late List<TextEditingController> _titleCtrls;
  late List<TextEditingController> _amountCtrls;

  @override
  void initState() {
    super.initState();
    _titleCtrls = widget.initialItems
        .map((e) => TextEditingController(text: e.title))
        .toList();
    _amountCtrls = widget.initialItems
        .map((e) => TextEditingController(text: e.amount.toInt().toString()))
        .toList();

    if (_titleCtrls.isEmpty) _addRow();
  }

  void _addRow() => setState(() {
    _titleCtrls.add(TextEditingController());
    _amountCtrls.add(TextEditingController());
  });

  void _removeRow(int i) {
    if (_titleCtrls.length > 1) {
      setState(() {
        _titleCtrls.removeAt(i);
        _amountCtrls.removeAt(i);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double spent = 0;
    List<CostItem> previews = [];

    for (int i = 0; i < _titleCtrls.length; i++) {
      double val = double.tryParse(_amountCtrls[i].text) ?? 0;
      spent += val;
      previews.add(
        CostItem(
          title: _titleCtrls[i].text,
          amount: val,
          color: AppColors.chartPalette[i % AppColors.chartPalette.length],
        ),
      );
    }

    final double remaining = widget.totalBudget - spent;

    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.black, // Match deep black background from images
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: "Cost Breakdown",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            textColor: AppColors.white,
          ),
          const SizedBox(height: 4),
          const CustomText(
            title: "How much do you need for this campion?",
            fontSize: 14,
            textColor: AppColors.grey,
          ),
          const SizedBox(height: 40),

          // --- CHART & TOTALS SECTION ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    title: "Total Budget :",
                    fontSize: 16,
                    textColor: AppColors.grey,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    title:
                        "\$${widget.totalBudget.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.white,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const CustomText(
                        title: "Remaining : ",
                        fontSize: 16,
                        textColor: AppColors.grey,
                      ),
                      CustomText(
                        title: "\$${remaining.toInt()}",
                        fontSize: 16,
                        textColor: remaining < 0
                            ? AppColors.error
                            : AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 140,
                width: 140,
                child: CustomPaint(
                  painter: MultiColorPiePainter(
                    items: previews,
                    total: widget.totalBudget,
                    showLabels: true,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- INPUT LIST ---
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _titleCtrls.length,
              itemBuilder: (c, i) => _buildInputRow(i),
            ),
          ),

          const SizedBox(height: 8),

          // --- ADD BUTTON ---
          Center(
            child: RoundedButton(
              label: "Add",
              icon: const Icon(Icons.add, color: AppColors.white, size: 18),
              backgroundColor: AppColors.darkGreyCard,
              width: 100,
              height: 40,
              onPressed: _addRow,
            ),
          ),

          const SizedBox(height: 32),

          // --- ACTION BUTTONS ---
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
                  backgroundColor: AppColors
                      .darkGreyCard, // Solid dark grey as per image_ba1a75.png
                  onPressed: () {
                    final validItems = previews
                        .where((e) => e.title.isNotEmpty && e.amount > 0)
                        .toList();
                    Navigator.pop(context, validItems);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow(int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: CustomTextField(
              label: "Title",
              controller: _titleCtrls[i],
              textColor: AppColors.white,
              borderRadius: 8,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: CustomTextField(
              label: "Amount",
              controller: _amountCtrls[i],
              keyboardType: TextInputType.number,
              textColor: AppColors.white,
              borderRadius: 8,
            ),
          ),
          IconButton(
            onPressed: () => _removeRow(i),
            icon: const Icon(Icons.remove, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
