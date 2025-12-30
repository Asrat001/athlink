
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/forms/input_field.dart';
import '../providers/rest_password/reset_password_provider.dart';
import '../providers/rest_password/state/reset_password_state.dart';

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



  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      final provider = ref.read(resetPasswordProvider.notifier);
      provider.resetPassword(
        password: _passwordController.text.trim(),
        context: context,
        otp: widget.otp,
      );
    }
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
            context.go(Routes.loginRouteName);
          }
        });
      }
    });

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text("ATHLINK"),
        centerTitle: true,
      ),
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
                            RoundedTextFormField(
                              controller: _passwordController,
                              radius: 50,
                              hintText: "Password",
                              textInputType: TextInputType.visiblePassword,
                              enableObscureTextToggle: true,
                              prefixIcon: SvgPicture.asset("assets/logos/lock.svg",width: 16,height: 16,),
                              validator:Validators.password,
                            ),
                            const SizedBox(height: 16),

                            RoundedTextFormField(
                              controller: _confirmPasswordController,
                              radius: 50,
                              hintText: "Confirm Password",
                              textInputType: TextInputType.visiblePassword,
                              enableObscureTextToggle: true,
                              prefixIcon: SvgPicture.asset("assets/logos/lock.svg",width: 16,height: 16,),
                              validator: (value) => Validators.confirmPassword(value, _passwordController.text),
                            ),
                            const SizedBox(height: 25),

                            // Reset Password Button
                            RoundedButton(
                              onPressed: () {
                               _resetPassword();
                              },
                              label: 'Reset Password',
                              submitting: resetPasswordState.isLoading,
                            ),
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