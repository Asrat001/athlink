import 'dart:io';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // Controllers
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _campaignController = TextEditingController();
  final TextEditingController _athletesController = TextEditingController();
  final TextEditingController _partnersController = TextEditingController();
  final TextEditingController _athleteNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Edit states
  bool _editAddress = false;
  bool _editCampaign = false;
  bool _editAthletes = false;
  bool _editPartners = false;

  // Focus nodes
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _campaignFocus = FocusNode();
  final FocusNode _athletesFocus = FocusNode();
  final FocusNode _partnersFocus = FocusNode();

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
      _campaignFocus,
      _campaignController,
      () => _editCampaign = false,
    );
    revertIfEmpty(
      _athletesFocus,
      _athletesController,
      () => _editAthletes = false,
    );
    revertIfEmpty(
      _partnersFocus,
      _partnersController,
      () => _editPartners = false,
    );
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
            // ignore: use_build_context_synchronously
            FocusScope.of(context).requestFocus(_addressFocus);
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
                      if (focusNode == _campaignFocus) _editCampaign = false;
                      if (focusNode == _athletesFocus) _editAthletes = false;
                      if (focusNode == _partnersFocus) _editPartners = false;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),
          const CustomText(
            title: 'SP Sport Agency',

            fontSize: 24,
            fontWeight: FontWeight.bold,
            textColor: AppColors.black,
          ),
          const SizedBox(height: 12),

          _addressWidget(),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _buildQuestionBox(
                    title: "How many",
                    subtitle: "Sponsorship Campaigns did you organize?",
                    controller: _campaignController,
                    editable: _editCampaign,
                    focusNode: _campaignFocus,
                    onTap: () {
                      setState(() => _editCampaign = true);
                      Future.delayed(const Duration(milliseconds: 80), () {
                        FocusScope.of(context).requestFocus(_campaignFocus);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _buildQuestionBox(
                    title: "How many",
                    subtitle: "Athletes Represented you so far?",
                    controller: _athletesController,
                    editable: _editAthletes,
                    focusNode: _athletesFocus,
                    onTap: () {
                      setState(() => _editAthletes = true);
                      Future.delayed(const Duration(milliseconds: 80), () {
                        FocusScope.of(context).requestFocus(_athletesFocus);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _buildQuestionBox(
                    title: "How many",
                    subtitle: "Global Partners do you have?",
                    controller: _partnersController,
                    editable: _editPartners,
                    focusNode: _partnersFocus,
                    onTap: () {
                      setState(() => _editPartners = true);
                      Future.delayed(const Duration(milliseconds: 80), () {
                        FocusScope.of(context).requestFocus(_partnersFocus);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: "Athletes Sponsored",

              fontSize: 16,
              fontWeight: FontWeight.w600,
              textColor: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),

          // Image upload section
          Row(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _selectedImage == null
                      ? const Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                          size: 40,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(_selectedImage!, fit: BoxFit.cover),
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          CustomTextField(
            label: "Enter Name of Athlete",
            borderRadius: 10,
            controller: _athleteNameController,
            // decoration: _inputDecoration(hint: 'Enter name of athlete'),
          ),

          const SizedBox(height: 20),

          CustomTextField(
            controller: _descriptionController,
            maxLines: 4,
            borderRadius: 10,
            label: 'Add a short description about your company',
          ),

          const SizedBox(height: 30),

          RoundedButton(
            label: "Save",
            onPressed: () {},
            width: double.infinity,
            height: 60,
            borderRadius: 5,
          ),
        ],
      ),
    );
  }
}
