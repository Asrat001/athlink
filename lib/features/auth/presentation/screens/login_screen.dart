import 'package:athlink/features/auth/presentation/providers/login/login_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:flutter/gestures.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/forms/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/widgets/forms/input_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(BuildContext context) async {
    setState(() {
      _autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (_formKey.currentState!.validate()) {
      final provider = ref.read(loginProvider.notifier);
      await provider.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
    }
  }

  void googleSignIn() async {
    final provider = ref.read(loginProvider.notifier);
    await provider.googleSignIn(context);
  }

  @override
  Widget build(BuildContext context) {
    final loginSate = ref.watch(loginProvider);
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
                      autovalidateMode: _autovalidateMode,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            CustomText(
                              title: "Login",
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 6),
                            RoundedTextFormField(
                              controller: _emailController,
                              radius: 50,
                              hintText: "Email Address",
                              textInputType: TextInputType.emailAddress,
                              prefixIcon: SvgPicture.asset(
                                "assets/logos/email.svg",
                                width: 16,
                                height: 16,
                              ),
                              validator: Validators.email,
                            ),
                            SizedBox(height: 6),
                            RoundedTextFormField(
                              controller: _passwordController,
                              radius: 50,
                              hintText: "Password",
                              textInputType: TextInputType.visiblePassword,
                              enableObscureTextToggle: true,
                              prefixIcon: SvgPicture.asset(
                                "assets/logos/lock.svg",
                                width: 16,
                                height: 16,
                              ),
                              validator: Validators.password,
                            ),
                            // CustomText(title: "")
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
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
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.push(
                                            Routes.forgotPasswordRouteName,
                                          );
                                        },
                                      text: "Resend",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            RoundedButton(
                              height: 45,
                              width: double.infinity,
                              submitting: loginSate.isLoading,
                              label: "Login",
                              onPressed: () {
                                login(context);
                              },
                            ),

                            SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  title: 'Don`t  have an account?  ',
                                  fontWeight: FontWeight.w300,
                                  textColor: Colors.grey[600],
                                  fontSize: 14,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.push(
                                      Routes.accountTypeSelectionRouteName,
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: GoogleFonts.roboto(
                                      color: AppColors.black,
                                      fontSize: 14,
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
                              onPressed: () {
                                googleSignIn();
                              },
                              text: "Continue with Google",
                              icon: Image.asset(
                                "assets/images/google_icon.png",
                              ),
                              height: 48,
                              borderRadius: 10,
                            ),
                            SizedBox(height: 10),
                            SocialLoginButton(
                              onPressed: () {
                                ref
                                    .read(loginProvider.notifier)
                                    .appleSignIn(context);
                              },
                              text: "Continue with Apple",
                              height: 48,
                              borderRadius: 10,
                              icon: Image.asset("assets/images/apple_icon.png"),
                            ),
                            SizedBox(height: 10),
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
