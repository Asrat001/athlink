
import 'package:athlink/features/auth/presentaion/providers/login/login_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/extensions/media_query_extension.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/utils/app_helpers.dart';
import '../../../../shared/utils/validators_utils.dart';
import '../../../../shared/widgets/forms/google_sign_in_button.dart';
import '../../../../shared/widgets/forms/input_field.dart';
import '../../../../shared/widgets/forms/rounded_button.dart';
import '../../../../shared/widgets/logo_label.dart';

class LoginScreen extends ConsumerStatefulWidget {

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void login() async{
    if (_formKey.currentState!.validate()) {
    final provider= ref.read(loginProvider.notifier);
    await provider.login(
      email: _emailController.text.trim(),
      password: _nameController.text.trim(),
      context: context,
    );
    }
  }



  @override
  Widget build(BuildContext context) {



    final loginSate = ref.watch(loginProvider);

    return Scaffold(
      body: PopScope(
        canPop: !loginSate.isLoading,
        child: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
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
                              const LogoLabel(size: 50, align: TextAlign.center),
                               Text(
                                "Welcome Back , We Missed You  💚 ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: context.isTablet ? 18 : 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: context.isTablet ? 28 : 24),
                              RoundedTextFormField(
                                textInputType: TextInputType.emailAddress,
                                controller: _emailController,
                                hintText: "Email",
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white70,
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.red[300]
                                ),
                                validator: Validators.email,
                              ),
                              SizedBox(height: 6,),
                              RoundedTextFormField(
                                textInputType: TextInputType.visiblePassword,
                                controller: _nameController,
                                enableObscureTextToggle: true,
                                hintText: "Password",
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.white70,
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red[300]
                                ),
                                validator: Validators.password,
                              ),
                              SizedBox(height: 4,),
                              GestureDetector(
                                onTap: (){
                                  AppHelpers.showInfoToast(context, "Coming Soon");
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Forgot Your Password ? ",
                                    style: TextStyle(color: Colors.grey.shade400,fontSize: 12.0),

                                  ),
                                ),
                              ),
                              SizedBox(height: context.isTablet ? 16 : 12),
                              RoundedButton(
                                onPressed: () =>  {
                                  login(),
                                },
                                submitting: loginSate.isLoading,
                                label: "Sign In",
                                padding: 16,
                              ),
                              SizedBox(height: context.isTablet ? 16 : 12),
                              const Text(
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
                                  context.push(Routes.registerRouteName);
                                },
                                child: Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                    text: "Don't  Have An Account ? ",
                                    children: [
                                      TextSpan(
                                        text: "Register ",
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
      ),
    );
  }
}
