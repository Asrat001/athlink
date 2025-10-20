import 'package:athlink/features/auth/presentaion/providers/otp_verification/otp_verification_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:athlink/shared/utils/app_helpers.dart';

class VerifyOTPScreen extends ConsumerStatefulWidget {
  final String email;
  final String purpose;

  const VerifyOTPScreen({
    super.key,
    required this.email,
    required this.purpose,
  });

  @override
  ConsumerState<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends ConsumerState<VerifyOTPScreen> {
  String _enteredOTP = '';

  @override
  void initState() {
    super.initState();
    // Set email and purpose in provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(otpVerificationProvider.notifier)
          .setEmailAndPurpose(email: widget.email, purpose: widget.purpose);

      // Set navigation callback
      ref.read(otpVerificationProvider.notifier).setNavigationCallback((
        email,
        purpose,
        otp,
      ) {
        if (mounted) {
          if (purpose == 'password_reset') {
            context.pushReplacement(
              Routes.resetPasswordRouteName,
              extra: {'email': email, 'token': otp},
            );
          } else if (purpose == 'registration') {
            context.pushReplacement(
              Routes.selectSportScreen,
              extra: {'email': email, 'token': otp},
            );
          }
        }
      });
    });
  }

  void _verifyOTP(BuildContext context) {
    if (_enteredOTP.length != 6) {
      AppHelpers.showErrorFlash(context, "Please enter a valid 6-digit code");
      return;
    }

    if (widget.purpose == "password_reset") {
      // Proceed to reset password screen
      context.pushReplacement(
        Routes.resetPasswordRouteName,
        extra: {
          'email': widget.email,
          'token': _enteredOTP,
          "otp": _enteredOTP,
        },
      );

      return;
    }

    final provider = ref.read(otpVerificationProvider.notifier);
    provider.verifyOtp(otp: _enteredOTP, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final otpState = ref.watch(otpVerificationProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: "ATHLINK",
        showBackButton: true,
        onBack: () => context.pop(),
      ),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: IgnorePointer(
                    ignoring: otpState.isLoading,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Header Icon
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.verified_user_outlined,
                              size: 40,
                              color: AppColors.primary,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Title
                          CustomText(
                            title: "Enter Verification Code",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.textPrimary,
                          ),

                          const SizedBox(height: 10),

                          // Description
                          Column(
                            children: [
                              CustomText(
                                title: "We sent a 6-digit code to",
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

                          // OTP Input Field
                          OtpTextField(
                            numberOfFields: 6,
                            borderColor: AppColors.grey,
                            focusedBorderColor: AppColors.primary,
                            showFieldAsBox: true,
                            borderWidth: 1.0,
                            borderRadius: BorderRadius.circular(12),
                            fieldWidth: 45,
                            textStyle: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                            clearText: true,
                            showCursor: false,
                            fillColor: Colors.white,
                            filled: true,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            onSubmit: (String verificationCode) {
                              _enteredOTP = verificationCode;
                              _verifyOTP(context);
                            },
                            onCodeChanged: (String code) {
                              _enteredOTP = code;
                            },
                          ),

                          const SizedBox(height: 25),

                          // Verify Button
                          RoundedButton(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            borderRadius: BorderRadius.circular(50),
                            backgroundColor: AppColors.buttonBackground,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            label: otpState.isLoading
                                ? "Verifying..."
                                : "Verify Code",
                            onPressed: () => _verifyOTP(context),
                            width: double.infinity,
                            submitting: otpState.isLoading,
                          ),

                          const SizedBox(height: 20),

                          // Back to Forgot Password
                          if (widget.purpose == "password_reset")
                            GestureDetector(
                              onTap: () {
                                context.pop();
                              },
                              child: Text(
                                'Change Email Address',
                                style: GoogleFonts.inter(
                                  color: AppColors.textPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),

                          // Error message display
                          if (otpState.errorMessage != null) ...[
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
                                title: otpState.errorMessage!,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
