import 'package:athlink/features/auth/presentation/screens/widgets/account_card.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:athlink/shared/extensions/account_type.dart';
import 'package:athlink/features/auth/presentation/providers/register/register_provider.dart';

class ChooseAccountTypeScreen extends ConsumerStatefulWidget {
  const ChooseAccountTypeScreen({super.key});

  @override
  ConsumerState<ChooseAccountTypeScreen> createState() =>
      _ChooseAccountTypeScreenState();
}

class _ChooseAccountTypeScreenState
    extends ConsumerState<ChooseAccountTypeScreen> {
  AccountType? _selectedType;

  void _onAccountTypeSelected(AccountType type) {
    setState(() {
      _selectedType = type;
    });
  }

  void _onNext() {
    if (_selectedType != null) {
      ref.read(registrationProvider.notifier).setAccountType(_selectedType!);

      context.push(Routes.registerRouteName);
    } else {
      AppHelpers.showErrorToast(context, 'Please select role');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "ATHLINK"),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24),
                  CustomText(
                    title: 'Choose role',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.black,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    title: 'Select how you\'ll use Athlink',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.grey,
                  ),
                  const SizedBox(height: 32),

                  AccountTypeCard(
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        AccountType.athlete.icon,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                    title: AccountType.athlete.name,
                    subtitle: AccountType.athlete.description,
                    isSelected: _selectedType == AccountType.athlete,
                    onTap: () => _onAccountTypeSelected(AccountType.athlete),
                  ),
                  const SizedBox(height: 16),

                  AccountTypeCard(
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        AccountType.sponsor.icon,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                    title: AccountType.sponsor.name,
                    subtitle: AccountType.sponsor.description,
                    isSelected: _selectedType == AccountType.sponsor,
                    onTap: () => _onAccountTypeSelected(AccountType.sponsor),
                  ),

                  const Spacer(),

                  RoundedButton(
                    height: 60,
                    label: "Continue",
                    onPressed: _onNext,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
