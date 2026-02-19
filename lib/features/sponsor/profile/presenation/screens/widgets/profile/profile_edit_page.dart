import 'dart:io';
import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';

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
    String? websiteUrl,
    Map<String, String>? socialLinks,
  )
  onSave;
  final bool isLoading;

  const ProfileEditPage({
    super.key,
    this.sponsorProfile,
    this.profileImage,
    this.bannerImage,
    required this.onSave,
    this.isLoading = false,
  });

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // Controllers
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  // Social Media Controllers
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _youtubeController = TextEditingController();
  final TextEditingController _tiktokController = TextEditingController();

  // Edit states
  bool _editAddress = false;
  bool _editCompanyName = false;

  // Focus nodes
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _companyNameFocus = FocusNode();

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
      _websiteController.text = widget.sponsorProfile!.websiteUrl;

      final socialLinks = widget.sponsorProfile!.socialLinks;
      _facebookController.text = socialLinks['facebook'] ?? '';
      _twitterController.text = socialLinks['twitter'] ?? '';
      _instagramController.text = socialLinks['instagram'] ?? '';
      _linkedinController.text = socialLinks['linkedin'] ?? '';
      _youtubeController.text = socialLinks['youtube'] ?? '';
      _tiktokController.text = socialLinks['tiktok'] ?? '';
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
    _websiteController.dispose();
    _facebookController.dispose();
    _twitterController.dispose();
    _instagramController.dispose();
    _linkedinController.dispose();
    _youtubeController.dispose();
    _tiktokController.dispose();

    _addressFocus.dispose();
    _companyNameFocus.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    String? hint,
    IconData? prefixIcon,
    Color? prefixIconColor,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: _lightGrey,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: prefixIconColor ?? Colors.grey, size: 20)
          : null,
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
          : _addressController.text.isNotEmpty
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: CustomText(
                title: _addressController.text,
                textColor: AppColors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            )
          : Container(
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CustomText(
          title: title,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textColor: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildSocialInput(
    String label,
    TextEditingController controller,
    IconData icon, {
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: _inputDecoration(
          hint: label,
          prefixIcon: icon,
          prefixIconColor: color,
        ),
        style: const TextStyle(fontSize: 14, color: AppColors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

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

                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: _inputDecoration(hint: "Description..."),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),

                  _buildSectionTitle("Website"),
                  TextFormField(
                    controller: _websiteController,
                    decoration: _inputDecoration(
                      hint: "https://example.com",
                      prefixIcon: Icons.language,
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),

                  _buildSectionTitle("Social Media"),
                  _buildSocialInput(
                    "Facebook URL",
                    _facebookController,
                    Icons.facebook,
                    color: const Color(0xFF1877F2),
                  ),
                  _buildSocialInput(
                    "X URL",
                    _twitterController,
                    Icons.alternate_email,
                    color: const Color(0xFF1DA1F2),
                  ), // Using alternate_email as simple proxy for X/Twitter
                  _buildSocialInput(
                    "Instagram URL",
                    _instagramController,
                    Icons.camera_alt_outlined,
                    color: const Color(0xFFE1306C),
                  ),
                  _buildSocialInput(
                    "LinkedIn URL",
                    _linkedinController,
                    Icons.work_outline,
                    color: const Color(0xFF0077B5),
                  ),
                  _buildSocialInput(
                    "YouTube URL",
                    _youtubeController,
                    Icons.video_library_outlined,
                    color: const Color(0xFFFF0000),
                  ),
                  _buildSocialInput(
                    "TikTok URL",
                    _tiktokController,
                    Icons.music_note,
                    color: Colors.black,
                  ),

                  const SizedBox(height: 30),
                  RoundedButton(
                    label: "Save Changes",
                    onPressed: _handleSave,
                    width: double.infinity,
                    height: 60,
                    submitting: widget.isLoading,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSave() {
    final String name = _companyNameController.text.trim();
    final String description = _descriptionController.text.trim();
    final String address = _addressController.text.trim();
    final String websiteUrl = _websiteController.text.trim();

    final Map<String, String> socialLinks = {};
    if (_facebookController.text.isNotEmpty)
      socialLinks['facebook'] = _facebookController.text.trim();
    if (_twitterController.text.isNotEmpty)
      socialLinks['twitter'] = _twitterController.text.trim();
    if (_instagramController.text.isNotEmpty)
      socialLinks['instagram'] = _instagramController.text.trim();
    if (_linkedinController.text.isNotEmpty)
      socialLinks['linkedin'] = _linkedinController.text.trim();
    if (_youtubeController.text.isNotEmpty)
      socialLinks['youtube'] = _youtubeController.text.trim();
    if (_tiktokController.text.isNotEmpty)
      socialLinks['tiktok'] = _tiktokController.text.trim();

    final File? profileImage = widget.profileImage;
    final File? bannerImage = widget.bannerImage;

    widget.onSave(
      name,
      description,
      address,
      profileImage,
      bannerImage,
      websiteUrl,
      socialLinks,
    );
  }
}
