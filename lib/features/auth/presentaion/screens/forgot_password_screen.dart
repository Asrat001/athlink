import 'package:athlink/features/auth/presentaion/providers/forgot_password/forgot_password_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/forms/custom_email_field.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    // Reset state when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(forgotPasswordProvider.notifier).resetState();

      // Set navigation callback
      ref.read(forgotPasswordProvider.notifier).setNavigationCallback((
        email,
        purpose,
      ) {
        if (mounted) {
          context.push(
            Routes.verifyOtpRouteName,
            extra: {'email': email, 'purpose': purpose},
          );
        }
      });
    });
  }

  void _sendOTP(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = ref.read(forgotPasswordProvider.notifier);
      await provider.sendOtp(
        email: _emailController.text.trim(),
        context: context,
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);

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
                    ignoring: forgotPasswordState.isLoading,
                    child: Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: Container(
                        width: double.infinity,
                        height: constraints.maxHeight,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            // Title
                            SizedBox(
                              width: double.infinity,
                              child: CustomText(
                                title: "Forgot Password?",
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                textColor: AppColors.textPrimary,
                                textAlign: TextAlign.start,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Description
                            CustomText(
                              title:
                                  "Enter your email and we'll send you a verification code",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: AppColors.textSecondary,
                              textAlign: TextAlign.start,
                            ),

                            const SizedBox(height: 30),

                            // Email Field
                            CustomEmailField(
                              controller: _emailController,
                              validator: Validators.email,
                            ),

                            const SizedBox(height: 25),

                            // Send OTP Button
                            RoundedButton(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              borderRadius: BorderRadius.circular(50),
                              backgroundColor: AppColors.buttonBackground,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              label: forgotPasswordState.isLoading
                                  ? "Sending Code..."
                                  : "Send Verification Code",
                              onPressed: () => _sendOTP(context),
                              width: double.infinity,
                              submitting: forgotPasswordState.isLoading,
                            ),

                            const SizedBox(height: 20),

                            // Error message display
                            if (forgotPasswordState.errorMessage != null) ...[
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
                                  title: forgotPasswordState.errorMessage!,
                                  textColor: AppColors.error,
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
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
