import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';

class StepOne extends StatelessWidget {
  final List<ProfileSport> sports;
  final TextEditingController titleController;
  final TextEditingController locationController;
  final TextEditingController descriptionController;
  final TextEditingController budgetController;
  final String? selectedSportId;
  final String? selectedSportName;
  final String selectedCurrency;
  final Function(String sportId, String sportName) onSportSelected;
  final Function(String currency) onCurrencySelected;
  final VoidCallback onNext;

  const StepOne({
    super.key,
    required this.sports,
    required this.titleController,
    required this.locationController,
    required this.descriptionController,
    required this.budgetController,
    required this.selectedSportId,
    required this.selectedSportName,
    required this.selectedCurrency,
    required this.onSportSelected,
    required this.onCurrencySelected,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SectionTitle(title: "Job Title"),
        const SizedBox(height: 8),
        InputField(
          hint: "e.g. Football Sponsorship Opportunity",
          controller: titleController,
        ),
        const SizedBox(height: 16),
        const SectionTitle(title: "Category"),
        const SizedBox(height: 8),
        sports.isEmpty
            ? const NoSportsAvailable()
            : SportsChips(
                sports: sports,
                selectedSportId: selectedSportId,
                onSportSelected: onSportSelected,
              ),
        const SizedBox(height: 16),
        const SectionTitle(title: "Location"),
        const SizedBox(height: 8),
        InputField(
          hint: "e.g. Paris, France",
          controller: locationController,
        ),
        const SizedBox(height: 16),
        const SectionTitle(title: "Description"),
        const SizedBox(height: 8),
        InputField(
          hint: "Write a detailed description...",
          maxLines: 4,
          controller: descriptionController,
        ),
        const SizedBox(height: 16),
        const SectionTitle(title: "Budget "),
        const SizedBox(height: 8),
        InputField(
          hint: "e.g. \$20,000",
          controller: budgetController,
        ),
        const SizedBox(height: 16),
        const SectionTitle(title: "Currency"),
        const SizedBox(height: 8),
        CurrencyDropdown(
          selectedCurrency: selectedCurrency,
          onCurrencySelected: onCurrencySelected,
        ),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerRight,
          child: RoundedButton(
            label: "Next",
            height: 40,
            width: 100,
            borderRadius: 10,
            onPressed: titleController.text.trim().isEmpty ? null : onNext,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: title,
      fontWeight: FontWeight.w600,
      textColor: AppColors.textPrimary,
    );
  }
}

class InputField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.extraLightGrey.withValues(alpha: 0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class NoSportsAvailable extends StatelessWidget {
  const NoSportsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: CustomText(
        title: "No sports available",
        fontSize: 14,
        textColor: AppColors.textGrey,
      ),
    );
  }
}

class SportsChips extends StatelessWidget {
  final List<ProfileSport> sports;
  final String? selectedSportId;
  final Function(String, String) onSportSelected;

  const SportsChips({
    super.key,
    required this.sports,
    required this.selectedSportId,
    required this.onSportSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sports.length,
        itemBuilder: (context, index) {
          final sport = sports[index];
          final isSelected = selectedSportId == sport.id;
          return SportChip(
            sport: sport,
            isSelected: isSelected,
            onTap: () => onSportSelected(sport.id, sport.name),
          );
        },
      ),
    );
  }
}

class SportChip extends StatelessWidget {
  final ProfileSport sport;
  final bool isSelected;
  final VoidCallback onTap;

  const SportChip({
    super.key,
    required this.sport,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Chip(
          label: Text(
            sport.name,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.textPrimary,
            ),
          ),
          backgroundColor:
              isSelected ? AppColors.primary : AppColors.extraLightGrey,
          side: BorderSide(
            color: isSelected ? AppColors.primary : AppColors.extraLightGrey,
          ),
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CurrencyDropdown extends StatelessWidget {
  final String selectedCurrency;
  final Function(String) onCurrencySelected;

  const CurrencyDropdown({
    super.key,
    required this.selectedCurrency,
    required this.onCurrencySelected,
  });

  @override
  Widget build(BuildContext context) {
    const currencies = ['Yuan', 'USD', 'EUR', 'GBP', 'JPY', 'ETB'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.extraLightGrey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCurrency,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textGrey,
          ),
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
          dropdownColor: AppColors.white,
          items: currencies.map((String currency) {
            return DropdownMenuItem<String>(
              value: currency,
              child: Text(currency),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onCurrencySelected(newValue);
            }
          },
        ),
      ),
    );
  }
}