import 'package:flutter/material.dart';
import '../../constant/constants.dart';
import '../../theme/app_colors.dart';

class RoundedTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? enabled;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextInputType textInputType;
  final int minLines;
  final int maxLines;
  final double? radius;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? maxLength;
  final String? counterText;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enableObscureTextToggle;

  const RoundedTextFormField({
    super.key,
    this.controller,
    this.enabled,
    this.radius,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.textInputType = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.errorText,
    this.errorStyle,
    this.maxLength,
    this.counterText,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.suffixIcon,
    this.enableObscureTextToggle = false,
  });

  @override
  State<RoundedTextFormField> createState() => _RoundedTextFormFieldState();
}

class _RoundedTextFormFieldState extends State<RoundedTextFormField> {
  late bool obscuringText = widget.enableObscureTextToggle;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context);

    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.textInputType,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      style: customTheme.textTheme.bodyMedium?.copyWith(
        color: Colors.grey.shade600,
      ),
      textInputAction: widget.textInputAction,
      obscureText: obscuringText,
      enableSuggestions: widget.enableObscureTextToggle ? false : true,
      autocorrect: widget.enableObscureTextToggle ? false : true,

      maxLength: widget.maxLength,
      textAlign: widget.textAlign,

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: customTheme.textTheme.bodySmall?.copyWith(
          color: Colors.grey.shade600,
        ),
        labelText: widget.labelText,
        labelStyle: customTheme.textTheme.bodySmall?.copyWith(
          color: Colors.grey.shade600,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cBorderRadius),
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 4),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 4),
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.6),
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.red[300]!, width: 1),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 16.0,
        ),
        filled: true,
        fillColor: Colors.white,
        counterText: widget.counterText,
        errorText: widget.errorText,
        errorStyle: widget.errorStyle,
        errorMaxLines: 5,

        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 12.0),
                child: widget.prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: 32.0,
        ),

        suffixIcon: widget.enableObscureTextToggle
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: AnimatedSwitcher(
                      duration: cFastAnimationDuration,
                      child: Icon(
                        color: Colors.grey.shade500,
                        obscuringText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        key: Key(
                          "ObscureTextIconButtonKeyValue=$obscuringText",
                        ),
                      ),
                    ),
                    splashRadius: 24.0,
                    color: customTheme.colorScheme.onSurface,
                    onPressed: () =>
                        setState(() => obscuringText = !obscuringText),
                  ),
                ),
              )
            : widget.suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 18.0),
                child: widget.suffixIcon,
              )
            : null,
      ),
    );
  }
}
