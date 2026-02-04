import 'dart:async';
import 'dart:convert';

import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class AddResultModal extends StatefulWidget {
  final Function(ResultData) onSave;
  final ResultData? initialRecord;

  const AddResultModal({super.key, required this.onSave, this.initialRecord});

  @override
  State<AddResultModal> createState() => _AddResultModalState();
}

class _AddResultModalState extends State<AddResultModal> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController _competitionController;
  late TextEditingController _dateController;
  late TextEditingController _positionController;
  late TextEditingController _totalCompetitorsController;
  late TextEditingController _divisionController;
  late TextEditingController _locationDataController;
  late TextEditingController _locationNameController;
  DateTime? _selectedDate;
  final String _googleApiKey = dotenv.env['GOOGLE_MAP_API_KEY'] ?? "";
  List<dynamic> _placePredictions = [];
  String _sessionToken = const Uuid().v4();
  Timer? _debounce;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _competitionController = TextEditingController(
      text: widget.initialRecord?.competition ?? '',
    );

    if (widget.initialRecord?.date != null &&
        widget.initialRecord!.date.isNotEmpty) {
      try {
        _selectedDate = DateTime.parse(widget.initialRecord!.date);
      } catch (_) {
        // Fallback or log error
      }
    }

    _dateController = TextEditingController(
      text: DateFormatter.formatFromISO(widget.initialRecord?.date ?? ''),
    );
    _divisionController = TextEditingController(
      text: widget.initialRecord?.division ?? '',
    );
    _locationDataController = TextEditingController(
      text: widget.initialRecord?.location ?? '',
    );
    _locationNameController = TextEditingController(
      text: widget.initialRecord?.location ?? '',
    );
    String pos = '';
    String total = '';
    if (widget.initialRecord != null) {
      final parts = widget.initialRecord!.position.split('/');
      if (parts.length == 2) {
        pos = parts[0];
        total = parts[1];
      }
    }
    _positionController = TextEditingController(text: pos);
    _totalCompetitorsController = TextEditingController(text: total);
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

  @override
  void dispose() {
    _competitionController.dispose();
    _dateController.dispose();
    _positionController.dispose();
    _totalCompetitorsController.dispose();
    _divisionController.dispose();
    _locationDataController.dispose();
    _locationNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(), // Cannot select future dates
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.blue,
              surface: AppColors.darkGreyCard,
            ),
            dialogTheme: DialogThemeData(backgroundColor: AppColors.black),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormatter.formatMedium(picked);
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final positionString =
          "${_positionController.text}/${_totalCompetitorsController.text}";
      final newResult = ResultData(
        id: widget.initialRecord?.id ?? '',
        date: _selectedDate != null
            ? DateFormatter.formatISO(_selectedDate!)
            : _dateController.text,
        position: positionString,
        competition: _competitionController.text,
        location: _locationNameController.text,
        division: _divisionController.text,
        competitionSummary: widget.initialRecord?.competitionSummary ?? '',
        resultLink: widget.initialRecord?.resultLink,
        mediaUrls: widget.initialRecord?.mediaUrls ?? [],
        flagUrl:
            widget.initialRecord?.flagUrl ?? 'https://flagcdn.com/w40/un.png',
      );
      widget.onSave(newResult);
      Navigator.pop(context);
    } else {
      setState(() => _autovalidateMode = AutovalidateMode.onUserInteraction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: widget.initialRecord != null
                    ? 'Edit Result'
                    : 'Add New Result',
                fontSize: 22,
                textColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 25),

              _buildLabel("Competition Name"),
              CustomTextField(
                label: 'Add Competition Name',
                controller: _competitionController,
                borderRadius: 12,
                textColor: AppColors.white,
                cursorColor: AppColors.white,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              _buildLabel("Location"),
              _buildPlacesField(),
              const SizedBox(height: 16),

              _buildLabel("Date"),
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: CustomTextField(
                    label: 'Select Date',
                    controller: _dateController,
                    borderRadius: 12,
                    textColor: AppColors.white,
                    cursorColor: AppColors.white,
                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildLabel("Position"),
              CustomTextField(
                label: 'e.g., 1',
                controller: _positionController,
                borderRadius: 12,
                textColor: AppColors.white,
                cursorColor: AppColors.white,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Required';
                  final num = int.tryParse(v);
                  if (num == null) return 'Must be a number';
                  if (num <= 0) return 'Must be greater than 0';
                  return null;
                },
              ),
              const SizedBox(width: 16),
              _buildLabel("Total Competitors"),
              CustomTextField(
                label: 'e.g., 70',
                controller: _totalCompetitorsController,
                borderRadius: 12,
                textColor: AppColors.white,
                cursorColor: AppColors.white,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Required';
                  final num = int.tryParse(v);
                  if (num == null) return 'Must be a number';
                  if (num <= 0) return 'Must be greater than 0';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              _buildLabel("Division"),
              CustomTextField(
                label: "e.g. Men's Open",
                controller: _divisionController,
                borderRadius: 12,
                textColor: AppColors.white,
                cursorColor: AppColors.white,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: _buildBtn(
                      "Cancel",
                      AppColors.transparent,
                      () => Navigator.pop(context),
                      isBordered: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildBtn(
                      "Save Result",
                      AppColors.darkGreyCard,
                      _handleSubmit,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8, left: 4),
    child: CustomText(
      title: text,
      fontSize: 14,
      textColor: AppColors.white.withValues(alpha: 0.9),
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
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
