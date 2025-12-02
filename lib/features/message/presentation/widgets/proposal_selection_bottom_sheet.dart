import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectableProposalItem {
  final String id;
  final String title;
  final String? subtitle;
  final String? logoUrl;

  SelectableProposalItem({
    required this.id,
    required this.title,
    this.subtitle,
    this.logoUrl,
  });
}

class ProposalSelectionBottomSheet extends StatefulWidget {
  final Function(SelectableProposalItem) onProposalSelected;

  const ProposalSelectionBottomSheet({
    super.key,
    required this.onProposalSelected,
  });

  @override
  State<ProposalSelectionBottomSheet> createState() =>
      _ProposalSelectionBottomSheetState();
}

class _ProposalSelectionBottomSheetState
    extends State<ProposalSelectionBottomSheet> {
  // Source of truth data
  final List<SelectableProposalItem> _allProposals = [
    SelectableProposalItem(
      id: '1',
      title: 'Brand Ambassador Deal',
      logoUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png',
    ),
    SelectableProposalItem(
      id: '2',
      title: 'Endorsement Deals',
      logoUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png',
    ),
    SelectableProposalItem(
      id: '3',
      title: 'Event Sponsorship',
      logoUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png',
    ),
    SelectableProposalItem(
      id: '4',
      title: 'Agency Representation',
      logoUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png',
    ),
  ];

  late List<SelectableProposalItem> _filteredProposals;
  SelectableProposalItem? _selectedProposal;

  @override
  void initState() {
    super.initState();
    _filteredProposals = _allProposals;
  }

  void _runFilter(String enteredKeyword) {
    List<SelectableProposalItem> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allProposals;
    } else {
      results = _allProposals
          .where(
            (item) =>
                item.title.toLowerCase().contains(enteredKeyword.toLowerCase()),
          )
          .toList();
    }

    setState(() {
      _filteredProposals = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 0),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: "Send Proposal",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            textColor: AppColors.black,
          ),
          const SizedBox(height: 16),
          TextFormField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              hintText: "Search for active job post",
              hintStyle: GoogleFonts.inter(
                color: AppColors.grey600,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: const Icon(Icons.search, color: AppColors.grey600),
              filled: true,
              fillColor: AppColors.lightBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _filteredProposals.isEmpty
                ? Center(
                    child: CustomText(
                      title: "No proposals found",
                      textColor: AppColors.grey600,
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredProposals.length,
                    itemBuilder: (context, index) {
                      final proposal = _filteredProposals[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (_selectedProposal?.id == proposal.id) {
                                _selectedProposal = null;
                              } else {
                                _selectedProposal = proposal;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  title: proposal.title,
                                  fontSize: 16,
                                  textColor: AppColors.black,
                                ),
                              ),
                              Checkbox(
                                value: _selectedProposal?.id == proposal.id,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedProposal = proposal;
                                    } else {
                                      _selectedProposal = null;
                                    }
                                  });
                                },
                                activeColor: AppColors.darkBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.darkBlue,
                    side: const BorderSide(color: AppColors.darkBlue),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: CustomText(
                    title: "Cancel",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _selectedProposal != null
                      ? () {
                          widget.onProposalSelected(_selectedProposal!);
                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: CustomText(
                    title: "Select",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
        ],
      ),
    );
  }
}
