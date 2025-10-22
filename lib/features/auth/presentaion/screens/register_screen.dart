import 'package:athlink/features/auth/presentaion/providers/register/register_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
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

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _companyController = TextEditingController();
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

  void googleSignIn(WidgetRef ref, BuildContext context) async{
    final provider = ref.read(registartionProvider.notifier);
    await provider.googleSignIn(context);
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final loginSate = ref.watch(registartionProvider);
    // State listener for handling success and errors
    ref.listen<RegisterState>(registartionProvider, (previous, current) {
      if (current.isSuccess&&!current.isSocialSignIn) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (context.mounted) {
            context.push(
              Routes.verifyOtpRouteName,
              extra: {
                'email': _emailController.text.trim(),
                "purpose": "registration",
              },
            );
          }
        });
      }else if(current.isSocialSignIn&&current.isSuccess){
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (context.mounted) {
          if(current.isNewUser){
            context.push(
              Routes.selectSportScreen,
            );
          }else{
            context.push(
              Routes.dashBoardRouteName,
            );
          }
          }
        });
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
                          spacing: 8,
                          children: [
                            CustomText(
                              title: "Sign Up",
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 6),
                            RoundedTextFormField(
                              controller: _companyController,
                              radius: 50,
                              hintText: "company Name",
                              textInputType: TextInputType.name,
                              prefixIcon: SvgPicture.asset("assets/logos/org.svg",width: 16,height: 16,),
                              validator:Validators.requiredField ,
                            ),
                            RoundedTextFormField(
                                controller: _emailController,
                                radius: 50,
                                hintText: "Email Address",
                                textInputType: TextInputType.emailAddress,
                                prefixIcon: SvgPicture.asset("assets/logos/email.svg",width: 16,height: 16,),
                                validator:Validators.email,
                            ),
                            RoundedTextFormField(
                                controller: _passwordController,
                                radius: 50,
                                hintText: "Password",
                                textInputType: TextInputType.visiblePassword,
                                enableObscureTextToggle: true,
                                prefixIcon: SvgPicture.asset("assets/logos/lock.svg",width: 16,height: 16,),
                                validator:Validators.password,
                            ),
                            RoundedTextFormField(
                                controller: _confirmPasswordController,
                                radius: 50,
                                hintText: "Confirm Password",
                                textInputType: TextInputType.visiblePassword,
                                enableObscureTextToggle: true,
                                prefixIcon: SvgPicture.asset("assets/logos/lock.svg",width: 16,height: 16,),
                                validator: (value) => Validators.confirmPassword(value, _passwordController.text),
                            ),
                            SizedBox(height: 15),
                            RoundedButton(
                              submitting:loginSate.isLoading,
                              label: "Sign Up",
                              onPressed: () {
                                register(ref, context);
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
                            SizedBox(height: 10),
                            SocialLoginButton(
                              onPressed: () {
                                AppHelpers.showInfoToast(context, "Coming Soon");
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
                                  'By signing up, you agree to Athlink\'s Terms & Privacylicy',
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
