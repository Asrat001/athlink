import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:athlink/features/athlete/profile/domain/models/career_record_ui.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class AddCareerModal extends StatefulWidget {
  final Function(CareerRecord) onSave;
  final CareerRecord? initialRecord;

  const AddCareerModal({super.key, required this.onSave, this.initialRecord});

  @override
  State<AddCareerModal> createState() => _AddCareerModalState();
}

class _AddCareerModalState extends State<AddCareerModal> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController _positionController;
  late TextEditingController _teamController;

  // This will store the concatenated "lat,lng,name" string
  late TextEditingController _locationDataController;
  // This is just for the UI text field display
  late TextEditingController _locationNameController;

  late TextEditingController _yearController;
  late TextEditingController _achievementsController;
  late TextEditingController _descriptionController;

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  int? _startYear;
  int? _endYear;
  bool _isCurrentlyThere = false;

  final String _googleApiKey = "AIzaSyCadihu3aTpQbUcC0GfoULhxEkEnvqQqAc";
  List<dynamic> _placePredictions = [];
  String _sessionToken = const Uuid().v4();
  Timer? _debounce;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _positionController = TextEditingController(
      text: widget.initialRecord?.position ?? '',
    );
    _teamController = TextEditingController(
      text: widget.initialRecord?.team ?? '',
    );

    _locationDataController = TextEditingController(
      text: widget.initialRecord?.location ?? '',
    );

    String initialDisplayName = widget.initialRecord?.location ?? '';
    if (initialDisplayName.contains(',')) {
      final parts = initialDisplayName.split(',');
      if (parts.length >= 3) {
        initialDisplayName = parts.sublist(2).join(',').trim();
      }
    }
    _locationNameController = TextEditingController(text: initialDisplayName);

    _yearController = TextEditingController(
      text: widget.initialRecord?.duration ?? '',
    );
    _achievementsController = TextEditingController(
      text: widget.initialRecord?.achievements ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.initialRecord?.description ?? '',
    );

    if (widget.initialRecord != null) {
      _parseDuration(widget.initialRecord!.duration);
    }
  }

  void _onLocationChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.isNotEmpty) {
        _getAutocomplete(value);
      } else {
        setState(() => _placePredictions = []);
      }
    });
  }

  Future<void> _getAutocomplete(String input) async {
    setState(() => _isSearching = true);
    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$_googleApiKey&sessiontoken=$_sessionToken";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(
          () => _placePredictions = json.decode(response.body)['predictions'],
        );
      }
    } finally {
      setState(() => _isSearching = false);
    }
  }

  Future<void> _getPlaceDetails(String placeId, String description) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=$_googleApiKey&sessiontoken=$_sessionToken";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final lat = data['result']['geometry']['location']['lat'];
      final lng = data['result']['geometry']['location']['lng'];

      // CONCATENATION LOGIC: lat,lng,name
      final concatenatedLocation = "$lat,$lng,$description";

      setState(() {
        _locationNameController.text = description;
        _locationDataController.text = concatenatedLocation;
        _placePredictions = [];
        _sessionToken = const Uuid().v4();
      });
      FocusScope.of(context).unfocus();
    }
  }

  // --- UI BUILDING ---

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height * 0.85;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHandle(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: widget.initialRecord != null
                          ? 'Edit Career Journey'
                          : 'Add New Career Journey',
                      fontSize: 22,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 24),
                    _buildImagePicker(),
                    const SizedBox(height: 25),
                    _buildLabel("Add Your Position"),
                    CustomTextField(
                      label: 'Center Back',
                      controller: _positionController,
                      borderRadius: 12,
                      textColor: AppColors.white,
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    _buildLabel("Add Name of the team"),
                    CustomTextField(
                      label: 'Green Bay Packers',
                      controller: _teamController,
                      borderRadius: 12,
                      textColor: AppColors.white,
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    _buildLabel("Location"),
                    _buildPlacesField(),
                    const SizedBox(height: 16),
                    _buildLabel("Add year"),
                    _buildYearPickerTrigger(),
                    const SizedBox(height: 16),
                    _buildLabel("Achievements"),
                    CustomTextField(
                      label: 'MVP, Top Scorer...',
                      controller: _achievementsController,
                      borderRadius: 12,
                      textColor: AppColors.white,
                    ),
                    const SizedBox(height: 16),
                    _buildLabel("Add description"),
                    CustomTextField(
                      label: 'Details about your role...',
                      controller: _descriptionController,
                      borderRadius: 12,
                      textColor: AppColors.white,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 32),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlacesField() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
          ),
          child: TextFormField(
            controller: _locationNameController,
            onChanged: _onLocationChanged,
            style: const TextStyle(color: AppColors.white, fontSize: 14),

            decoration: InputDecoration(
              hintText: 'Search Location...',
              hintStyle: TextStyle(
                color: AppColors.white.withValues(alpha: 0.3),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.error, width: 1),
              ),
              suffixIcon: _isSearching
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.lightGrey,
                    ),
            ),
          ),
        ),
        if (_placePredictions.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 8),
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: AppColors.darkGreyCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _placePredictions.length,
              separatorBuilder: (context, index) => Divider(
                color: AppColors.white.withValues(alpha: 0.05),
                height: 1,
              ),
              itemBuilder: (context, index) {
                final p = _placePredictions[index];
                return ListTile(
                  leading: const Icon(
                    Icons.place,
                    color: AppColors.lightGrey,
                    size: 18,
                  ),
                  title: Text(
                    p['description'],
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () =>
                      _getPlaceDetails(p['place_id'], p['description']),
                );
              },
            ),
          ),
      ],
    );
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
        CareerRecord(
          logoUrl:
              _selectedImage?.path ??
              widget.initialRecord?.logoUrl ??
              'https://i.ibb.co/vzB7pGq/packers-logo.png',
          position: _positionController.text,
          team: _teamController.text,
          location:
              _locationDataController.text, // Sending the "lat,lng,name" string
          duration: _yearController.text,
          achievements: _achievementsController.text,
          description: _descriptionController.text,
        ),
      );
      Navigator.pop(context);
    } else {
      setState(() => _autovalidateMode = AutovalidateMode.onUserInteraction);
    }
  }

  // --- REUSED UI HELPERS ---
  Widget _buildHandle() => Center(
    child: Container(
      margin: const EdgeInsets.only(top: 12),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
  Widget _buildImagePicker() => Center(
    child: GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.darkGreyCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
          image: _selectedImage != null
              ? DecorationImage(
                  image: FileImage(_selectedImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _selectedImage == null
            ? const Icon(
                Icons.image_outlined,
                color: AppColors.lightGrey,
                size: 30,
              )
            : null,
      ),
    ),
  );
  Widget _buildYearPickerTrigger() => GestureDetector(
    onTap: _showYearRangePicker,
    child: AbsorbPointer(
      child: CustomTextField(
        label: 'Select Year Range',
        controller: _yearController,
        borderRadius: 12,
        textColor: AppColors.white,
        validator: (v) => v!.isEmpty ? 'Required' : null,
      ),
    ),
  );
  Widget _buildActionButtons() => Row(
    children: [
      Expanded(
        child: _buildBtn("Save Journey", AppColors.darkGreyCard, _handleSave),
      ),
      const SizedBox(width: 15),
      Expanded(
        child: _buildBtn(
          "Cancel",
          AppColors.transparent,
          () => Navigator.pop(context),
          isBordered: true,
        ),
      ),
    ],
  );
  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8, left: 4),
    child: CustomText(
      title: text,
      fontSize: 14,
      textColor: AppColors.lightGrey,
    ),
  );
  Widget _buildBtn(
    String text,
    Color color,
    VoidCallback onTap, {
    bool isBordered = false,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        border: isBordered
            ? Border.all(color: AppColors.white.withValues(alpha: 0.2))
            : null,
      ),
      child: CustomText(
        title: text,
        textColor: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  Future<void> _pickImage() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (file != null) setState(() => _selectedImage = File(file.path));
  }

  void _parseDuration(String duration) {
    try {
      final parts = duration.split(' - ');
      if (parts.length == 2) {
        _startYear = int.tryParse(parts[0]);
        if (parts[1].toLowerCase() == 'present')
          _isCurrentlyThere = true;
        else
          _endYear = int.tryParse(parts[1]);
      }
    } catch (_) {}
  }

  void _showYearRangePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkGreyCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            int currentYear = DateTime.now().year;
            List<int> allYears = List.generate(
              50,
              (index) => currentYear - index,
            );
            List<int> filteredEndYears = _startYear == null
                ? []
                : allYears.where((y) => y >= _startYear!).toList();
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomText(
                    title: 'Select Duration',
                    fontSize: 18,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildYearDropdown("Start", _startYear, (val) {
                          setModalState(() {
                            _startYear = val;
                            if (_endYear != null && _endYear! < _startYear!)
                              _endYear = null;
                          });
                        }, allYears),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _isCurrentlyThere
                            ? _buildPresentBox()
                            : _buildYearDropdown(
                                "End",
                                _endYear,
                                (val) => setModalState(() => _endYear = val),
                                filteredEndYears,
                                enabled: _startYear != null,
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: AppColors.lightGrey),
                    child: CheckboxListTile(
                      title: const CustomText(
                        title: "I currently play here",
                        fontSize: 14,
                        textColor: AppColors.white,
                      ),
                      value: _isCurrentlyThere,
                      activeColor: AppColors.blue,
                      side: const BorderSide(color: AppColors.lightGrey),
                      contentPadding: EdgeInsets.zero,
                      onChanged: (val) => setModalState(() {
                        _isCurrentlyThere = val!;
                        if (_isCurrentlyThere) _endYear = null;
                      }),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildBtn("Confirm", AppColors.blue, () {
                    if (_startYear != null) {
                      setState(
                        () => _yearController.text = _isCurrentlyThere
                            ? "$_startYear - Present"
                            : "$_startYear - ${_endYear ?? ''}",
                      );
                      Navigator.pop(context);
                    }
                  }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPresentBox() => Container(
    height: 56,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.black,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.white.withValues(alpha: 0.05)),
    ),
    child: const CustomText(title: "Present", textColor: AppColors.white),
  );
  Widget _buildYearDropdown(
    String label,
    int? value,
    Function(int?) onChanged,
    List<int> years, {
    bool enabled = true,
  }) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.4,
      child: DropdownButtonFormField<int>(
        value: value,
        dropdownColor: AppColors.darkGreyCard,
        iconEnabledColor: AppColors.white,
        hint: Text(
          label,
          style: const TextStyle(color: AppColors.lightGrey, fontSize: 13),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        items: years
            .map(
              (y) => DropdownMenuItem(
                value: y,
                child: Text(
                  y.toString(),
                  style: const TextStyle(color: AppColors.white),
                ),
              ),
            )
            .toList(),
        onChanged: enabled ? onChanged : null,
      ),
    );
  }
}
