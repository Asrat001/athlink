
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/validators_utils.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../shared/widgets/forms/input_field.dart';
import '../providers/forgot_password/forgot_password_provider.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void forgotPassword() async {
   if(_formKey.currentState!.validate()){
     final provider=ref.read(forgotPasswordProvider.notifier);
     provider.sendOtp(email: _emailController.text.trim(), context: context);
   }
  }


  @override
  Widget build(BuildContext context) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("ATHLINK"),
        centerTitle: true,
      ),
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
                            RoundedTextFormField(
                              controller: _emailController,
                              radius: 50,
                              hintText: "Email Address",
                              textInputType: TextInputType.emailAddress,
                              prefixIcon: SvgPicture.asset("assets/logos/email.svg",width: 16,height: 16,),
                              validator:Validators.email,
                            ),
                            const SizedBox(height: 25),
                            RoundedButton(
                              submitting: forgotPasswordState.isLoading,
                              label: "Continue",
                              onPressed: () {
                              forgotPassword();
                              },
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