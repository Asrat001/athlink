import 'package:athlink/features/auth/presentaion/providers/login/login_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_email_field.dart';
import 'package:athlink/shared/widgets/forms/custom_password_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/forms/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = ref.read(loginProvider.notifier);
      await provider.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // appBar: const CustomAppBar(title: "ATHLINK"),
      body: PopScope(
        canPop: !loginState.isLoading,
        child: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: IgnorePointer(
                      ignoring: loginState.isLoading,
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 6,
                            children: [
                              CustomText(
                                title: "Login",
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                textColor: AppColors.textPrimary,
                              ),

                              const SizedBox(height: 20),

                              // Email Field
                              CustomEmailField(
                                controller: _emailController,
                                validator: Validators.email,
                              ),

                              const SizedBox(height: 10),

                              // Password Field
                              CustomPasswordField(
                                controller: _passwordController,
                                label: "Password",
                                validator: Validators.requiredField,
                              ),

                              const SizedBox(height: 8),

                              // CustomText(title: "")
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: AppColors.textSecondary,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text:
                                            "Use the email you signed up with\n\n",
                                      ),

                                      TextSpan(
                                        text: "Forgot password? ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Resend",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Login Button
                              RoundedButton(
                                label: "Log in",
                                onPressed: () => login(context),
                                width: double.infinity,
                                backgroundColor: Colors.black,

                                submitting: loginState.isLoading,
                                fontWeight: FontWeight.bold,
                                borderRadius: BorderRadius.circular(20),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Signup redirect
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    title: "Don't have an account? ",
                                    fontWeight: FontWeight.w300,
                                    textColor: AppColors.textSecondary,
                                    fontSize: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        context.push(Routes.registerRouteName),
                                    child: Text(
                                      'Sign up',
                                      style: GoogleFonts.roboto(
                                        color: AppColors.textPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              // OR Divider
                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(color: AppColors.divider),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: CustomText(
                                      title: "OR",
                                      textColor: AppColors.textGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(color: AppColors.divider),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              // Social Login Buttons
                              SocialLoginButton(
                                onPressed: () {},
                                text: "Continue with Google",
                                icon: Image.asset(
                                  "assets/images/google_icon.png",
                                  width: 24,
                                ),
                                backgroundColor:
                                    AppColors.socialButtonBackground,
                                textColor: AppColors.socialButtonText,
                                borderColor: AppColors.socialButtonBorder,
                              ),
                              const SizedBox(height: 10),
                              SocialLoginButton(
                                onPressed: () {},
                                text: "Continue with Apple",
                                icon: Image.asset(
                                  "assets/images/apple_icon.png",
                                  width: 24,
                                ),
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
      ),
    );
  }
}
