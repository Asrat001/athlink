import 'dart:io';
import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  final SponsorProfile? sponsorProfile;
  final File? profileImage;
  final File? bannerImage;
  final Function(
    String name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
  )
  onSave;

  const ProfileEditPage({
    super.key,
    this.sponsorProfile,
    this.profileImage,
    this.bannerImage,
    required this.onSave,
  });

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // Controllers
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();

  // Edit states
  bool _editAddress = false;
  bool _editCompanyName = false;

  // Focus nodes
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _campaignFocus = FocusNode();
  final FocusNode _athletesFocus = FocusNode();
  final FocusNode _partnersFocus = FocusNode();
  final FocusNode _companyNameFocus = FocusNode();

  // Image
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  // Visual constants
  final Color _primaryDark = const Color(0xFF0C2031);
  final Color _fillGrey = Colors.grey.shade200;
  final Color _lightGrey = Colors.grey.shade100;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing profile data
    if (widget.sponsorProfile != null) {
      _companyNameController.text = widget.sponsorProfile!.name;
      _addressController.text = widget.sponsorProfile!.address;
      _descriptionController.text = widget.sponsorProfile!.description;
    }

    void revertIfEmpty(
      FocusNode node,
      TextEditingController controller,
      VoidCallback setEdit,
    ) {
      node.addListener(() {
        if (!node.hasFocus && controller.text.trim().isEmpty) {
          setState(setEdit);
        }
      });
    }

    revertIfEmpty(
      _addressFocus,
      _addressController,
      () => _editAddress = false,
    );
    revertIfEmpty(
      _companyNameFocus,
      _companyNameController,
      () => _editCompanyName = false,
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _descriptionController.dispose();
    _companyNameController.dispose();
    _addressFocus.dispose();
    _campaignFocus.dispose();
    _athletesFocus.dispose();
    _partnersFocus.dispose();
    _companyNameFocus.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: _lightGrey,

      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: _primaryDark),
      ),
    );
  }

  Widget _addressWidget() {
    return GestureDetector(
      onTap: () {
        if (!_editAddress) {
          setState(() => _editAddress = true);
          Future.delayed(const Duration(milliseconds: 80), () {
            if (mounted) {
              FocusScope.of(context).requestFocus(_addressFocus);
            }
          });
        }
      },
      child: _editAddress
          ? TextFormField(
              focusNode: _addressFocus,
              controller: _addressController,
              decoration: _inputDecoration(hint: "Enter address"),
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 14, color: AppColors.black),
              onSaved: (_) {
                if (_addressController.text.trim().isEmpty) {
                  setState(() => _editAddress = false);
                } else {
                  _addressFocus.unfocus();
                }
              },
            )
          : Container(
              // width: double.infinity,
              decoration: BoxDecoration(
                color: _fillGrey,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey.shade300),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: const Center(
                child: CustomText(
                  title: 'Add Address',

                  textColor: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }

  Widget _buildQuestionBox({
    required String title,
    required String subtitle,
    required TextEditingController controller,
    required bool editable,
    required FocusNode focusNode,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        if (!editable) onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        // height: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: editable ? _lightGrey : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: editable ? Border.all(color: Colors.grey.shade300) : null,
        ),
        child: editable
            ? TextFormField(
                focusNode: focusNode,
                controller: controller,
                style: const TextStyle(fontSize: 14, color: AppColors.black),
                decoration: InputDecoration(
                  hintText: subtitle,
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                ),
                textInputAction: TextInputAction.done,
                onSaved: (_) {
                  if (controller.text.trim().isEmpty) {
                    setState(() {
                    
                    });
                  } else {
                    focusNode.unfocus();
                  }
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: title,
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.black87,
                  ),
                  const SizedBox(height: 6),
                  CustomText(
                    title: subtitle,
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.grey,
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _selectedImage = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!_editCompanyName) {
                      setState(() => _editCompanyName = true);
                      Future.delayed(const Duration(milliseconds: 80), () {
                        if (mounted) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_companyNameFocus);
                        }
                      });
                    }
                  },
                  child: _editCompanyName
                      ? TextFormField(
                          focusNode: _companyNameFocus,
                          controller: _companyNameController,
                          decoration: _inputDecoration(
                            hint: "Enter company name",
                          ),
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          onSaved: (_) {
                            if (_companyNameController.text.trim().isEmpty) {
                              setState(() => _editCompanyName = false);
                            } else {
                              _companyNameFocus.unfocus();
                            }
                          },
                        )
                      : CustomText(
                          title: _companyNameController.text.isEmpty
                              ? 'SP Sport Agency'
                              : _companyNameController.text,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.black,
                        ),
                ),
                const SizedBox(height: 12),
                _addressWidget(),
                const SizedBox(height: 30),
                RoundedButton(
                  label: "Save",
                  onPressed: _handleSave,
                  width: double.infinity,
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleSave() {
    // Get the current values from controllers, or use existing profile data if unchanged
    final String name = _companyNameController.text.trim().isNotEmpty
        ? _companyNameController.text.trim()
        : widget.sponsorProfile?.name ?? '';

    final String? description = _descriptionController.text.trim().isNotEmpty
        ? _descriptionController.text.trim()
        : widget.sponsorProfile?.description;

    final String? address = _addressController.text.trim().isNotEmpty
        ? _addressController.text.trim()
        : widget.sponsorProfile?.address;

    // Use selected image if available, otherwise use the image passed from ProfileScreen
    final File? profileImage = _selectedImage ?? widget.profileImage;
    final File? bannerImage = widget.bannerImage;

    // Call the onSave callback with all the data
    widget.onSave(name, description, address, profileImage, bannerImage);
  }
}
