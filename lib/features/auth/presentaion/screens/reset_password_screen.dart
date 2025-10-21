import 'package:athlink/features/auth/presentaion/providers/reset_password/reset_password_provider.dart';
import 'package:athlink/features/auth/presentaion/providers/reset_password/state/reset_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_password_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  final String token;
  final String email;
  final String otp;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.token,
    required this.otp,
  });

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    // Set email and token in provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(resetPasswordProvider.notifier)
          .setEmailAndToken(
            email: widget.email,
            token: widget.token,
            otp: widget.otp,
          );
    });
  }

  void _resetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final provider = ref.read(resetPasswordProvider.notifier);
      provider.resetPassword(
        password: _passwordController.text.trim(),
        context: context,
        otp: widget.otp,
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String? _confirmPasswordValidator(String? value) {
    return Validators.confirmPassword(value, _passwordController.text);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resetPasswordState = ref.watch(resetPasswordProvider);

    // Listen for state changes and handle navigation
    ref.listen<ResetPasswordState>(resetPasswordProvider, (previous, current) {
      if (current.isSuccess && context.mounted) {
        // Navigate to login screen after successful password reset
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (context.mounted) {
            context.pushReplacement(Routes.loginRouteName);
          }
        });
      }
    });

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(title: "ATHLINK", showBackButton: true),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: IgnorePointer(
                    ignoring: resetPasswordState.isLoading,
                    child: Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),

                            // Title
                            CustomText(
                              title: "Create New Password",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.textPrimary,
                            ),

                            const SizedBox(height: 10),

                            // Description
                            Column(
                              children: [
                                CustomText(
                                  title:
                                      "Create a new password for your account",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColors.textSecondary,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                CustomText(
                                  title: widget.email,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColors.textPrimary,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            // New Password Field
                            CustomPasswordField(
                              controller: _passwordController,
                              label: "New Password",
                              validator: Validators.password,
                            ),

                            const SizedBox(height: 16),

                            // Confirm Password Field
                            CustomPasswordField(
                              label: "Confirm New Password",
                              controller: _confirmPasswordController,
                              validator: _confirmPasswordValidator,
                            ),

                            const SizedBox(height: 25),

                            // Reset Password Button
                            RoundedButton(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              backgroundColor: AppColors.buttonBackground,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              label: resetPasswordState.isLoading
                                  ? "Resetting Password..."
                                  : "Reset Password",
                              onPressed: () => _resetPassword(context),
                              width: double.infinity,
                              submitting: resetPasswordState.isLoading,
                            ),

                            // Error message display
                            if (resetPasswordState.errorMessage != null) ...[
                              const SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.error.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.error.withOpacity(0.3),
                                  ),
                                ),
                                child: CustomText(
                                  title: resetPasswordState.errorMessage!,
                                  textColor: AppColors.error,
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
