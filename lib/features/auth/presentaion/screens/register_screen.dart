import 'package:athlink/features/auth/presentaion/providers/register/register_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/forms/social_login_button.dart'
    show SocialLoginButton;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/utils/app_helpers.dart';
import '../../../../shared/utils/validators_utils.dart';
import '../../../../shared/widgets/forms/input_field.dart';
import '../providers/register/state/register_state.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _companyController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _autoValidate = false;

  void register(BuildContext context) async {
    // context.push(Routes.selectSportScreen);
    // return;

    if (_formKey.currentState!.validate()) {
      final provider = ref.read(registartionProvider.notifier);
      await provider.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void googleSignIn(WidgetRef ref, BuildContext context) async {
    final provider = ref.read(registartionProvider.notifier);
    await provider.googleSignIn(context);
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
    final registerState = ref.watch(
      registartionProvider,
    ); // Fixed variable name
    // State listener for handling success and errors
    ref.listen<RegisterState>(registartionProvider, (previous, current) {
      if (current.isSuccess) {
        final provider = ref.read(registartionProvider.notifier);

        if (!current.isSocialSignIn) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (context.mounted) {
              provider.resetState(); // Reset before navigation
              context.push(
                Routes.verifyOtpRouteName,
                extra: {
                  'email': _emailController.text.trim(),
                  "purpose": "registration",
                },
              );
            }
          });
        } else {
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (context.mounted) {
              provider.resetState(); // Reset before navigation
              if (current.isNewUser) {
                context.push(Routes.selectSportScreen);
              } else {
                context.push(Routes.dashBoardRouteName);
              }
            }
          });
        }
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
                    ignoring: registerState
                        .isLoading, // Now using correct variable name
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
                          spacing: 8,
                          children: [
                            CustomText(
                              title: "Sign Up",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.textPrimary,
                            ),
                            SizedBox(height: 6),
                            RoundedTextFormField(
                              controller: _companyController,
                              radius: 50,
                              hintText: "Company Name",
                              textInputType: TextInputType.name,
                              prefixIcon: SvgPicture.asset(
                                "assets/logos/org.svg",
                                width: 16,
                                height: 16,
                              ),
                              validator: Validators.requiredField,
                            ),
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
                            RoundedTextFormField(
                              controller: _confirmPasswordController,
                              radius: 50,
                              hintText: "Confirm Password",
                              textInputType: TextInputType.visiblePassword,
                              enableObscureTextToggle: true,
                              prefixIcon: SvgPicture.asset(
                                "assets/logos/lock.svg",
                                width: 16,
                                height: 16,
                              ),
                              validator: (value) => Validators.confirmPassword(
                                value,
                                _passwordController.text,
                              ),
                            ),
                            SizedBox(height: 15),
                            RoundedButton(
                              height: 45,
                              width: double.infinity,
                              submitting:
                                  registerState.isLoading, // Fixed here too
                              label: "Sign Up",
                              onPressed: () {
                                register(
                                  context,
                                ); // Fixed: removed extra ref parameter
                              },
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  title: 'Already have an account?  ',
                                  fontWeight: FontWeight.w300,
                                  textColor: Colors.grey[600],
                                  fontSize: 12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.push(Routes.loginRouteName);
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.roboto(
                                      color: AppColors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            SizedBox(height: 4),
                            SocialLoginButton(
                              onPressed: () {
                                googleSignIn(ref, context);
                              },
                              text: "Continue with Google",
                              icon: Image.asset(
                                "assets/images/google_icon.png",
                              ),
                              height: 48,
                              borderRadius: 10,
                            ),
                            SizedBox(height: 7),
                            SocialLoginButton(
                              onPressed: () {
                                AppHelpers.showInfoToast(
                                  context,
                                  "Coming Soon",
                                );
                              },
                              text: "Continue with Apple",
                              height: 48,
                              borderRadius: 10,
                              icon: Image.asset("assets/images/apple_icon.png"),
                            ),
                            SizedBox(height: 2),
                            CustomText(
                              textAlign: TextAlign.center,
                              title:
                                  'By signing up, you agree to Athlink\'s Terms & Privacy Policy',
                              fontWeight: FontWeight.w300,
                              textColor: Colors.grey[600],
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
