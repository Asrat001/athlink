import 'package:athlink/features/auth/presentaion/providers/register/register_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/utils/app_helpers.dart';
import '../../../../shared/utils/validators_utils.dart';
import '../../../../shared/widgets/forms/google_sign_in_button.dart';
import '../../../../shared/widgets/forms/input_field.dart';
import '../../../../shared/widgets/forms/rounded_button.dart';
import '../../../../shared/widgets/logo_label.dart';
import '../providers/register/state/register_state.dart';


class RegisterScreen extends ConsumerWidget {

  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        AppHelpers.showSuccessToast(context, "Registration Successful, Please Login");
        context.push(Routes.loginRouteName);
      }
    });


    return Scaffold(
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
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 6,
                          children: [
                            LogoLabel(size: 50, align: TextAlign.center),
                            Text(
                              "Explore and Discover Your Favorite Podcast , Radios And More  All in  One Place",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: context.isTablet ? 18 : 16,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: context.isTablet ? 8 : 10),
                            RoundedTextFormField(
                              textInputType: TextInputType.text,
                              controller: _nameController,
                              hintText: "Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white70,
                              ),
                              validator: Validators.requiredField,
                            ),
                            SizedBox(height: context.isTablet ? 8 : 10),
                            RoundedTextFormField(
                              textInputType: TextInputType.emailAddress,
                              controller: _emailController,
                              hintText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white70,
                              ),
                              validator: Validators.email,
                            ),
                            SizedBox(height: context.isTablet ? 8 : 10),
                            RoundedTextFormField(
                              textInputType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              hintText: "Password",
                              enableObscureTextToggle: true,
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.white70,
                              ),
                              validator: Validators.password,
                            ),
                            SizedBox(height: context.isTablet ? 16 : 12),
                            RoundedButton(
                              onPressed: () => {
                                register(ref, context),
                              },
                              submitting: loginSate.isLoading,
                              label: "Sign In",
                              padding: 16,
                            ),
                            SizedBox(height: context.isTablet ? 16 : 12),
                            Text(
                              "OR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: Colors.white70,
                                decorationThickness: 2,
                              ),
                            ),
                            SizedBox(height: context.isTablet ? 16 : 12),
                            GoogleSignInButton(onPressed: () {}, padding: 16),
                            SizedBox(height: context.isTablet ? 16 : 12),
                            GestureDetector(
                              onTap: (){
                                context.push(Routes.loginRouteName);
                              },
                              child: Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                      text: "You Already  Have An Account ? ",
                                      children: [
                                        TextSpan(
                                            text: "Login",
                                            style: TextStyle(color: AppColors.primary)
                                        )
                                      ]

                                  )
                              ),
                            )
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
