import 'dart:math';
import 'package:athlink/features/sports/domain/models/sport_model.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/sports_provider.dart';

class SelectSportScreen extends ConsumerStatefulWidget {
  const SelectSportScreen({super.key});

  @override
  ConsumerState<SelectSportScreen> createState() => _SelectSportScreenState();
}

class _SelectSportScreenState extends ConsumerState<SelectSportScreen> {
  final Set<String> _selectedNames = {};
  final Random random = Random();
  String _searchQuery = "";

  static const double selectedItemSize = 80;
  static const double unselectedItemSize = 110;
  static const double spacing = 14;
  static const int crossAxisCount = 3;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sportsProvider.notifier).getSports();

      ref.read(sportSelectionProvider.notifier).setSuccessCallback(() {
        if (mounted) {
          context.go(Routes.dashBoardRouteName);
        }
      });
    });
  }

  List<String> get _selectedSportIds {
    final sportsState = ref.read(sportsProvider);
    final sports = sportsState.sports;

    return sports
        .where((sport) => _selectedNames.contains(sport.name))
        .map((sport) => sport.id)
        .toList();
  }

  void _toggleSelection(String name) {
    setState(() {
      if (_selectedNames.contains(name)) {
        _selectedNames.remove(name);
      } else {
        // Append new selection at end
        _selectedNames.add(name);
      }

      _shuffleUnselected();
    });
  }

  void _submitSelectedSports(BuildContext context) {
    final selectedIds = _selectedSportIds;

    if (selectedIds.isEmpty) {
      AppHelpers.showErrorFlash(context, "Please select at least one sport");
      return;
    }

    final provider = ref.read(sportSelectionProvider.notifier);
    provider.submitSelectedSports(sportIds: selectedIds, context: context);
  }

  void _shuffleUnselected() {
    final sportsState = ref.read(sportsProvider);
    final sports = sportsState.sports;

    if (sports.isEmpty) return;

    final selectedSports = sports
        .where((s) => _selectedNames.contains(s.name))
        .toList();

    final selectedCategoryIds = selectedSports
        .map((s) => s.sportCategoryId)
        .toSet();

    final unselected = sports
        .where((s) => !_selectedNames.contains(s.name))
        .toList();

    if (selectedCategoryIds.isNotEmpty) {
      unselected.sort((a, b) {
        final aIsSameCategory = selectedCategoryIds.contains(a.sportCategoryId);
        final bIsSameCategory = selectedCategoryIds.contains(b.sportCategoryId);

        if (aIsSameCategory && !bIsSameCategory) return -1; // a first
        if (!aIsSameCategory && bIsSameCategory) return 1; // b first
        return a.name.compareTo(b.name); // otherwise alphabetical
      });
    } else {
      // If no selected sports, sort alphabetically
      unselected.sort((a, b) => a.name.compareTo(b.name));
    }

    // Reorder final list (selected first, then unselected)
    final reordered = [...selectedSports, ...unselected];

    // Update provider
    ref.read(sportsProvider.notifier).updateSportsOrder(reordered);
  }

  List<Sport> get _filteredSports {
    final sportsState = ref.watch(sportsProvider);
    final sports = sportsState.sports;

    final selected = sports.where((s) => _selectedNames.contains(s.name));
    final unselected = sports.where(
      (s) =>
          !_selectedNames.contains(s.name) &&
          s.name.toLowerCase().contains(_searchQuery.toLowerCase()),
    );
    return [...selected, ...unselected];
  }

  Widget _buildSportItem(Sport sport, int index) {
    final isSelected = _selectedNames.contains(sport.name);

    return GestureDetector(
      onTap: () => _toggleSelection(sport.name),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: isSelected ? selectedItemSize : unselectedItemSize,
        height: isSelected ? selectedItemSize : unselectedItemSize,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.extraLightGrey, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // You can use sport.icon if available in your model
                  // For now using a placeholder, replace with actual icon from API
                  Image.asset(
                    "assets/images/${sport.name.toLowerCase()}.png", // Adjust based on your asset structure
                    width: isSelected ? 28 : 35,
                    height: isSelected ? 28 : 35,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback icon if asset not found
                      return Icon(
                        Icons.sports,
                        size: isSelected ? 28 : 35,
                        color: AppColors.primary,
                      );
                    },
                  ),
                  const SizedBox(height: 6),
                  CustomText(
                    textAlign: TextAlign.center,
                    title: sport.name,
                    fontWeight: FontWeight.w600,
                    fontSize: isSelected ? 10 : 12,
                    textColor: isSelected
                        ? AppColors.primary
                        : AppColors.textPrimary,
                  ),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.white,
                    size: 10,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }

  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title: "Failed to load sports",
            textColor: AppColors.error,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          CustomText(
            title: errorMessage,
            textColor: AppColors.textSecondary,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          RoundedButton(
            label: "Retry",
            onPressed: () {
              ref.read(sportsProvider.notifier).getSports();
            },
            width: 120,
          ),
        ],
      ),
    );
  }

  Widget _buildSportsGrid() {
    final allItems = _filteredSports;
    final double gridWidth =
        crossAxisCount * unselectedItemSize + (crossAxisCount - 1) * spacing;

    final totalRows = (allItems.length / crossAxisCount).ceil();
    final totalHeight = totalRows * (unselectedItemSize + spacing);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: SizedBox(
          width: gridWidth,
          height: totalHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              for (int i = 0; i < allItems.length; i++)
                AnimatedPositioned(
                  key: ValueKey(allItems[i].id), // Use sport ID as key
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  left: (i % crossAxisCount) * (unselectedItemSize + spacing),
                  top: (i ~/ crossAxisCount) * (unselectedItemSize + spacing),
                  child: _buildSportItem(allItems[i], i),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sportsState = ref.watch(sportsProvider);
    final sportSelectionState = ref.watch(sportSelectionProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(title: "ATHLINK", showBackButton: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // 🔍 Search bar
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 0.7,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (v) => setState(() => _searchQuery = v),
                        style: GoogleFonts.inter(color: AppColors.black),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset("assets/images/search.png"),
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.inter(
                            color: AppColors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    const CustomText(
                      title:
                          "Choose the 3 sport categories you want to sponsor the most.",
                      textAlign: TextAlign.center,
                      textColor: AppColors.textSecondary,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 20),

                    // ✅ Scrollable grid section
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          if (sportsState.isLoading) {
                            return _buildLoadingState();
                          }

                          if (sportsState.errorMessage != null) {
                            return _buildErrorState(sportsState.errorMessage!);
                          }

                          if (sportsState.sports.isEmpty) {
                            return const Center(
                              child: CustomText(
                                title: "No sports available",
                                textColor: AppColors.textSecondary,
                                fontSize: 16,
                              ),
                            );
                          }

                          return _buildSportsGrid();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              height: _selectedNames.isNotEmpty ? 80 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _selectedNames.isNotEmpty ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Center(
                    child: RoundedButton(
                      borderRadius: BorderRadius.circular(50),
                      width: MediaQuery.of(context).size.width * 0.5,
                      label: sportSelectionState.isLoading
                          ? "Submitting..."
                          : "Done",
                      onPressed: sportSelectionState.isLoading
                          ? null
                          : () {
                              _submitSelectedSports(context);
                            },
                      submitting: sportSelectionState.isLoading,
                    ),
                  ),
                ),
              ),
            ),

            // Error message display for sport selection
            if (sportSelectionState.errorMessage != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.error.withOpacity(0.3)),
                ),
                child: CustomText(
                  title: sportSelectionState.errorMessage!,
                  textColor: AppColors.error,
                  fontSize: 14,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
