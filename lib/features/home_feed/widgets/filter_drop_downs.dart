// ignore: library_prefixes
import 'dart:math' as Math;

import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FilterData {
  final String title;
  final List<String> options;

  FilterData(this.title, this.options);
}

class FilterBar extends StatefulWidget {
  final List<FilterData> filters;

  const FilterBar({super.key, required this.filters});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String? _openFilter;
  OverlayEntry? _overlayEntry;
  final Map<String, Set<String>> _selectedOptions = {};

  // Persistent keys for each filter
  final Map<String, GlobalKey> _filterKeys = {};

  @override
  void initState() {
    super.initState();
    for (var filter in widget.filters) {
      _filterKeys[filter.title] = GlobalKey();
    }
  }

  void _toggleFilter(BuildContext context, String title, List<String> options) {
    if (_openFilter == title) {
      _closeDropdown();
      return;
    }

    _closeDropdown();
    setState(() => _openFilter = title);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _filterKeys[title]!;
      _showDropdown(context, key, title, options);
    });
  }

  void _showDropdown(
    BuildContext context,
    GlobalKey key,
    String title,
    List<String> options,
  ) {
    final overlay = Overlay.maybeOf(context);
    if (overlay == null || !mounted) return;

    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;

    // Calculate the intrinsic width needed for the dropdown content
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    double maxTextWidth = 0;
    for (final option in options) {
      textPainter.text = TextSpan(
        text: option,
        style: const TextStyle(fontSize: 14),
      );
      textPainter.layout();
      maxTextWidth = Math.max(maxTextWidth, textPainter.width);
    }

    final intrinsicWidth = 20 + 6 + maxTextWidth + 20;
    final minWidth = 120.0;
    final requiredWidth = Math.max(intrinsicWidth, minWidth);

    final availableRight = screenSize.width - position.dx - 16;
    final availableLeft = position.dx - 16;

    double leftPosition;
    double containerWidth;

    if (availableRight >= requiredWidth) {
      // Enough space on the right - position normally
      leftPosition = position.dx;
      containerWidth = requiredWidth;
    } else if (availableLeft >= requiredWidth) {
      // Not enough space on right, but enough on left - shift to left
      leftPosition = position.dx - (requiredWidth - size.width);
      containerWidth = requiredWidth;
    } else if (availableRight + availableLeft >= requiredWidth) {
      // Can fit if we use both sides (edge case)
      leftPosition = 16; // Minimum margin
      containerWidth = screenSize.width - 32; // Full width minus margins
    } else {
      // Very constrained space - use maximum available width
      leftPosition = 16;
      containerWidth = screenSize.width - 32;
    }

    // Ensure the dropdown stays within screen bounds
    leftPosition = leftPosition.clamp(
      8.0,
      screenSize.width - containerWidth - 8,
    );

    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDropdown,
              behavior: HitTestBehavior.translucent,
              child: Container(color: AppColors.transparent),
            ),
          ),
          Positioned(
            left: leftPosition,
            top: position.dy + size.height + 8,
            child: Material(
              color: AppColors.transparent,
              child: Container(
                width: containerWidth,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: options.map((opt) {
                    final selected =
                        _selectedOptions[title]?.contains(opt) ?? false;
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        _toggleOption(title, opt);
                        _refreshOverlay(context, key, title, options);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: selected,
                                onChanged: (_) {
                                  _toggleOption(title, opt);
                                  _refreshOverlay(context, key, title, options);
                                },
                                activeColor: AppColors.primary,
                                checkColor: AppColors.white,
                                side: BorderSide(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                opt,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                ),
                                // No overflow - text will wrap if needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _refreshOverlay(
    BuildContext context,
    GlobalKey key,
    String title,
    List<String> options,
  ) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _showDropdown(context, key, title, options);
  }

  void _toggleOption(String filterTitle, String option) {
    setState(() {
      _selectedOptions[filterTitle] ??= <String>{};
      if (_selectedOptions[filterTitle]!.contains(option)) {
        _selectedOptions[filterTitle]!.remove(option);
      } else {
        _selectedOptions[filterTitle]!.add(option);
      }
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (_openFilter != null) setState(() => _openFilter = null);
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final filter = widget.filters[index];
          final isOpen = _openFilter == filter.title;
          final key = _filterKeys[filter.title]!;

          return GestureDetector(
            key: key,
            onTap: () => _toggleFilter(context, filter.title, filter.options),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isOpen ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: isOpen ? AppColors.primary : AppColors.grey,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    filter.title,
                    style: TextStyle(
                      color: isOpen ? AppColors.white : AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: isOpen ? AppColors.white : AppColors.textPrimary,
                    size: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
