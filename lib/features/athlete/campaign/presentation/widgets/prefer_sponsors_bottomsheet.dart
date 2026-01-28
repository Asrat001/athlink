import 'dart:async';
import 'package:athlink/features/athlete/campaign/domain/models/sponsor_search_response.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/campaign_detail_provider.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferredSponsorsBottomSheet extends ConsumerStatefulWidget {
  final String campaignId;
  final List<Sponsor> alreadySelected;
  const PreferredSponsorsBottomSheet({
    super.key,
    required this.campaignId,
    required this.alreadySelected,
  });

  @override
  ConsumerState<PreferredSponsorsBottomSheet> createState() =>
      _PreferredSponsorsBottomSheetState();
}

class _PreferredSponsorsBottomSheetState
    extends ConsumerState<PreferredSponsorsBottomSheet> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  List<SponsorSearchModel> _searchResults = [];
  bool _isLoading = false;
  late List<String> _selectedSponsorIds;

  @override
  void initState() {
    super.initState();
    // We only need the IDs for the update endpoint
    _selectedSponsorIds = widget.alreadySelected
        .map((s) => s.id ?? '')
        .where((id) => id.isNotEmpty)
        .toList();

    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_searchController.text.isNotEmpty) {
        _performSearch(_searchController.text);
      } else {
        setState(() {
          _searchResults = [];
        });
      }
    });
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    final response = await ref
        .read(campaignDetailProvider(widget.campaignId).notifier)
        .searchSponsors(query);

    response.when(
      success: (data) {
        setState(() {
          _searchResults = data.data.sponsors;
          _isLoading = false;
        });
      },
      failure: (error) {
        setState(() {
          _isLoading = false;
        });
        // Optionally show error
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: "Preferred Sponsors",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            textColor: AppColors.white,
          ),
          const SizedBox(height: 8),
          const CustomText(
            title: "Search and select brands you're interested in.",
            fontSize: 14,
            textColor: AppColors.grey,
          ),
          const SizedBox(height: 24),

          CustomTextField(
            label: "Search with a name",
            controller: _searchController,
            icon: const Icon(Icons.search, color: AppColors.grey),
            borderRadius: 12,
            textColor: AppColors.white,
          ),

          const SizedBox(height: 24),

          if (_isLoading)
            const Center(child: CircularProgressIndicator(color: Colors.orange))
          else if (_searchResults.isEmpty && _searchController.text.isNotEmpty)
            const Center(
              child: CustomText(
                title: "No sponsors found",
                textColor: AppColors.grey,
              ),
            )
          else
            Expanded(
              child: GridView.builder(
                itemCount: _searchResults.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final sponsor = _searchResults[index];
                  final isSelected = _selectedSponsorIds.contains(sponsor.id);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedSponsorIds.remove(sponsor.id);
                        } else {
                          _selectedSponsorIds.add(sponsor.id);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkGreyCard,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? Colors.orange
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black,
                              image:
                                  sponsor.sponsorProfile.profileImageUrl != null
                                  ? DecorationImage(
                                      image: NetworkImage(
                                        "$fileBaseUrl${sponsor.sponsorProfile.profileImageUrl}",
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child:
                                sponsor.sponsorProfile.profileImageUrl == null
                                ? const Icon(
                                    Icons.business,
                                    color: Colors.white,
                                    size: 24,
                                  )
                                : null,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: CustomText(
                              title: sponsor.sponsorProfile.name,
                              fontSize: 12,
                              textColor: AppColors.white,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          CustomText(
                            title: sponsor.sport.isNotEmpty
                                ? sponsor.sport.first.name
                                : "General",
                            fontSize: 10,
                            textColor: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 24),
          RoundedButton(
            label: "Update Preferred Sponsors",
            backgroundColor: AppColors.darkGreyCard,
            onPressed: () {
              Navigator.pop(context, _selectedSponsorIds);
            },
          ),
        ],
      ),
    );
  }
}
