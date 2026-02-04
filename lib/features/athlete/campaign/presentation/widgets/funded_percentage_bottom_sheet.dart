import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';

class FundedPercentageBottomSheet extends StatefulWidget {
  final double? initialPercentage;
  final void Function(double) onSave;

  const FundedPercentageBottomSheet({
    super.key,
    this.initialPercentage,
    required this.onSave,
  });

  @override
  State<FundedPercentageBottomSheet> createState() =>
      _FundedPercentageBottomSheetState();
}

class _FundedPercentageBottomSheetState
    extends State<FundedPercentageBottomSheet> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.initialPercentage != null) {
      final val = widget.initialPercentage!;
      // Handle both decimal (0.0-1.0) and whole number (0-100) formats
      final percentage = val <= 1.0 ? (val * 100).toInt() : val.toInt();
      _controller.text = percentage.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40,
      ),
      decoration: const BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Text(
              "Funded Level",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Funded Percentage (%)",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Enter value (0-100)",
              controller: _controller,
              keyboardType: TextInputType.number,
              textColor: Colors.white,
              cursorColor: Colors.white,
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(
                _error!,
                style: const TextStyle(color: AppColors.error, fontSize: 12),
              ),
            ],
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
                    isLoading: _isLoading,
                    onTap: () {
                      final value = _controller.text;
                      if (value.isEmpty) {
                        setState(() => _error = "Please enter a value");
                        return;
                      }
                      final numValue = double.tryParse(value);
                      if (numValue == null) {
                        setState(() => _error = "Please enter a valid number");
                        return;
                      }
                      if (numValue < 0 || numValue > 100) {
                        setState(
                          () => _error = "Value must be between 0 and 100",
                        );
                        return;
                      }

                      setState(() {
                        _isLoading = true;
                        _error = null;
                      });
                      widget.onSave(numValue);
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

class _ActionBtn extends StatelessWidget {
  final String label;
  final bool isOutlined;
  final bool isLoading;
  final VoidCallback onTap;
  const _ActionBtn({
    required this.label,
    required this.isOutlined,
    this.isLoading = false,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: isLoading ? () {} : onTap,
        style: TextButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: isOutlined
                ? const BorderSide(color: AppColors.border)
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
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
