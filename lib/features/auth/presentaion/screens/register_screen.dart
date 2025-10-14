import 'package:athlink/features/auth/presentaion/providers/register/register_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
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
import '../providers/register/state/register_state.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void register(WidgetRef ref, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = ref.read(registartionProvider.notifier);
      await provider.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final loginSate = ref.watch(registartionProvider);
    ref.listen<RegisterState>(registartionProvider, (previous, next) {
      if (next.isSuccess) {
        AppHelpers.showSuccessToast(
          context,
          "Registration Successful, Please Login",
        );
        context.push(Routes.loginRouteName);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "ATHLINK"),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: IgnorePointer(
                    ignoring: loginSate.isLoading,
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 6,
                          children: [
                            // LogoLabel(size: 50, align: TextAlign.center),
                            // Text(
                            //   "Explore and Discover Your Favorite Athlete , Brands And More  All in  One Place",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     color: Colors.white.withOpacity(0.6),
                            //     fontSize: context.isTablet ? 18 : 16,
                            //     height: 1.5,
                            //     fontWeight: FontWeight.w300,
                            //   ),
                            // ),
                            // SizedBox(height: context.isTablet ? 8 : 10),
                            // RoundedTextFormField(
                            //   textInputType: TextInputType.text,
                            //   controller: _nameController,
                            //   hintText: "Name",
                            //   prefixIcon: Icon(
                            //     Icons.person,
                            //     color: Colors.white70,
                            //   ),
                            //   validator: Validators.requiredField,
                            // ),
                            // SizedBox(height: context.isTablet ? 8 : 10),
                            // RoundedTextFormField(
                            //   textInputType: TextInputType.emailAddress,
                            //   controller: _emailController,
                            //   hintText: "Email",
                            //   prefixIcon: Icon(
                            //     Icons.email,
                            //     color: Colors.white70,
                            //   ),
                            //   validator: Validators.email,
                            // ),
                            // SizedBox(height: context.isTablet ? 8 : 10),
                            // RoundedTextFormField(
                            //   textInputType: TextInputType.visiblePassword,
                            //   controller: _passwordController,
                            //   hintText: "Password",
                            //   enableObscureTextToggle: true,
                            //   prefixIcon: Icon(
                            //     Icons.password,
                            //     color: Colors.white70,
                            //   ),
                            //   validator: Validators.password,
                            // ),
                            // SizedBox(height: context.isTablet ? 16 : 12),
                            // RoundedButton(
                            //   onPressed: () => {register(ref, context)},
                            //   submitting: loginSate.isLoading,
                            //   label: "Sign In",
                            //   padding: 16,
                            // ),
                            // SizedBox(height: context.isTablet ? 16 : 12),
                            // Text(
                            //   "OR",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     decoration: TextDecoration.underline,
                            //     decorationStyle: TextDecorationStyle.solid,
                            //     decorationColor: Colors.white70,
                            //     decorationThickness: 2,
                            //   ),
                            // ),
                            // SizedBox(height: context.isTablet ? 16 : 12),
                            // GoogleSignInButton(onPressed: () {}, padding: 16),
                            // SizedBox(height: context.isTablet ? 16 : 12),
                            // GestureDetector(
                            //   onTap: () {
                            //     context.push(Routes.loginRouteName);
                            //   },
                            //   child: Text.rich(
                            //     textAlign: TextAlign.center,
                            //     TextSpan(
                            //       text: "You Already  Have An Account ? ",
                            //       children: [
                            //         TextSpan(
                            //           text: "Login",
                            //           style: TextStyle(
                            //             color: AppColors.primary,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            CustomText(
                              title: "Sign Up",
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),

                            SizedBox(height: 10),

                            CustomTextField(
                              label: "Company Name",
                              icon: Image.asset("assets/images/company.png"),
                              controller: _nameController,
                            ),

                            SizedBox(height: 10),
                            CustomEmailField(controller: _emailController),
                            SizedBox(height: 10),
                            CustomPasswordField(
                              controller: _passwordController,
                              label: "Password",
                            ),
                            SizedBox(height: 10),
                            CustomPasswordField(
                              label: "Confirm Password",
                              controller: _confirmPasswordController,
                            ),

                            SizedBox(height: 20),

                            RoundedButton(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              borderRadius: BorderRadius.circular(20),
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              label: "Sign Up",
                              onPressed: () {
                                context.push(Routes.selectSportScreen);
                              },
                              width: double.infinity,
                            ),

                            SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  title: 'Already have an account?  ',
                                  fontWeight: FontWeight.w300,
                                  textColor: Colors.grey[600],
                                  fontSize: 16,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.roboto(
                                      color: AppColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(color: Colors.grey),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: CustomText(
                                    title: "OR",
                                    textColor: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(color: Colors.grey),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),
                            SocialLoginButton(
                              onPressed: () {},
                              text: "Continue with Google",
                              icon: Image.asset(
                                "assets/images/google_icon.png",
                              ),
                            ),
                            SizedBox(height: 10),
                            SocialLoginButton(
                              onPressed: () {},
                              text: "Continue with Apple",
                              icon: Image.asset("assets/images/apple_icon.png"),
                            ),

                            SizedBox(height: 10),

                            CustomText(
                              textAlign: TextAlign.center,
                              title:
                                  'By signing up, you agree to Athlink\'s Terms & Privacylicy',
                              fontWeight: FontWeight.w300,
                              textColor: Colors.grey[600],
                              fontSize: 16,
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
