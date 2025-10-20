import 'package:athlink/features/auth/presentaion/providers/register/register_provider.dart';
import 'package:athlink/features/auth/presentaion/providers/register/state/register_state.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/forms/custom_email_field.dart';
import 'package:athlink/shared/widgets/forms/custom_password_field.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/forms/social_login_button.dart'
    show SocialLoginButton;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/utils/app_helpers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _autoValidate = false;

  void register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = ref.read(registartionProvider.notifier);
      await provider.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
    } else {
      // Enable auto validation after first failed attempt
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String? _confirmPasswordValidator(String? value) {
    return Validators.confirmPassword(value, _passwordController.text);
  }

  @override
  void initState() {
    super.initState();
    // Reset state when screen is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(registartionProvider.notifier).resetState();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final registerState = ref.watch(registartionProvider);

    // State listener for handling success and errors
    ref.listen<RegisterState>(registartionProvider, (previous, current) {
      if (current.isSuccess) {
        AppHelpers.showSuccessToast(
          context,
          "Registration Successful, Please Login",
        );
        // Navigate to login after a short delay to show the toast
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (context.mounted) {
            context.push(Routes.loginRouteName);
          }
        });
      }
    });

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(title: "ATHLINK"),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: IgnorePointer(
                    ignoring: registerState.isLoading,
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
                          spacing: 6,
                          children: [
                            CustomText(
                              title: "Sign Up",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.textPrimary,
                            ),

                            SizedBox(height: 3),
                            CustomTextField(
                              label: "Company Name",
                              icon: Image.asset("assets/images/company.png"),
                              controller: _nameController,
                              validator: (value) => Validators.requiredField(
                                value,
                                fieldName: "Company name",
                              ),
                            ),

                            SizedBox(height: 3),
                            CustomEmailField(
                              controller: _emailController,
                              validator: Validators.email,
                            ),
                            SizedBox(height: 3),
                            CustomPasswordField(
                              controller: _passwordController,
                              label: "Password",
                              validator: Validators.password,
                            ),
                            SizedBox(height: 3),
                            CustomPasswordField(
                              label: "Confirm Password",
                              controller: _confirmPasswordController,
                              validator: _confirmPasswordValidator,
                            ),

                            SizedBox(height: 7),

                            RoundedButton(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              borderRadius: BorderRadius.circular(50),
                              backgroundColor: AppColors.buttonBackground,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              label: registerState.isLoading
                                  ? "Creating Account..."
                                  : "Sign Up",
                              onPressed: () => register(context),
                              width: double.infinity,
                              submitting: registerState.isLoading,
                            ),

                            SizedBox(height: 7),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  title: 'Already have an account?  ',
                                  fontWeight: FontWeight.w300,
                                  textColor: AppColors.textSecondary,
                                  fontSize: 14,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.push(Routes.loginRouteName);
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.inter(
                                      color: AppColors.textPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

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

                            SizedBox(height: 7),
                            SocialLoginButton(
                              onPressed: () {},
                              text: "Continue with Google",
                              icon: Image.asset(
                                "assets/images/google_icon.png",
                              ),
                              backgroundColor: AppColors.socialButtonBackground,
                              textColor: AppColors.socialButtonText,
                              borderColor: AppColors.socialButtonBorder,
                            ),
                            SizedBox(height: 7),
                            SocialLoginButton(
                              onPressed: () {},
                              text: "Continue with Apple",
                              icon: Image.asset("assets/images/apple_icon.png"),
                            ),

                            SizedBox(height: 7),

                            CustomText(
                              textAlign: TextAlign.center,
                              title:
                                  'By signing up, you agree to Athlink\'s Terms & Privacy Policy',
                              fontWeight: FontWeight.w300,
                              textColor: AppColors.textSecondary,
                              fontSize: 12,
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
