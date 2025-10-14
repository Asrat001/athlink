import 'dart:math';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart';

class SelectSportScreen extends StatefulWidget {
  const SelectSportScreen({super.key});

  @override
  State<SelectSportScreen> createState() => _SelectSportScreenState();
}

class _SelectSportScreenState extends State<SelectSportScreen> {
  final List<Map<String, String>> _sports = [
    {"name": "Sprinting", "icon": "assets/images/sprinting.png"},
    {"name": "Soccer", "icon": "assets/images/soccer.png"},
    {"name": "Rugby", "icon": "assets/images/rugby.png"},
    {"name": "Archery", "icon": "assets/images/archery.png"},
    {"name": "Basketball", "icon": "assets/images/basketball.png"},
    {"name": "Baseball", "icon": "assets/images/baseball.png"},
    {"name": "Football", "icon": "assets/images/football.png"},
    {"name": "Golf", "icon": "assets/images/golf.png"},
    {"name": "Handball", "icon": "assets/images/handball.png"},
    {"name": "Netball", "icon": "assets/images/netball.png"},
  ];

  final random = Random();
  static const int crossAxisCount = 3;
  static const double spacing = 14;
  static const double itemWidth = 100;
  static const double itemHeight = 110;

  void _shuffleFromIndex(int index) {
    setState(() {
      final top = _sports.sublist(0, index);
      final bottom = _sports.sublist(index);
      bottom.shuffle(random);
      _sports
        ..clear()
        ..addAll([...top, ...bottom]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double gridWidth =
        crossAxisCount * itemWidth + (crossAxisCount - 1) * spacing;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "ATHLINK"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // const SizedBox(height: 16),
              const CustomText(
                title: "Select Sports",
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    icon: Image.asset(
                      "assets/images/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomText(
                fontWeight: FontWeight.w300,
                title:
                    "Choose the sport categories you want to sponsor the most.",
                textAlign: TextAlign.center,
                textColor: Colors.grey,
                fontSize: 14,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: gridWidth,
                    child: Stack(
                      children: [
                        for (int i = 0; i < _sports.length; i++)
                          AnimatedPositioned(
                            key: ValueKey(_sports[i]["name"]),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            left: (i % crossAxisCount) * (itemWidth + spacing),
                            top: (i ~/ crossAxisCount) * (itemHeight + spacing),
                            child: GestureDetector(
                              onTap: () => _shuffleFromIndex(i),
                              child: Container(
                                width: itemWidth,
                                height: itemHeight,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withValues(alpha: 0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      _sports[i]["icon"]!,
                                      width: 32,
                                      height: 32,
                                    ),
                                    const SizedBox(height: 8),
                                    CustomText(
                                      title: _sports[i]["name"]!,

                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
