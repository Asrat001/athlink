
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../../shared/theme/app_colors.dart';
import '../../../data/data.dart';

class FeedCarousel extends StatefulWidget {
  const FeedCarousel({super.key});

  @override
  State<FeedCarousel> createState() => _FeedCarouselState();
}

class _FeedCarouselState extends State<FeedCarousel> {
  final List<String> imageUrls = imageUrlsList;

  final Map<String, Color> _dominantColors = {};
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _extractAllColors();
  }

  Future<void> _extractAllColors() async {
    for (var url in imageUrls) {
      final color = await _getDominantColor(url);
      setState(() {
        _dominantColors[url] = color ?? Colors.black;
      });
    }
  }

  Future<Color?> _getDominantColor(String imageUrl) async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
        size: const Size(200, 200),
      );
      return palette.dominantColor?.color;
    } catch (_) {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: CarouselSlider.builder(
            itemCount: imageUrls.length,
            options: CarouselOptions(
              height: 60,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              final imageUrl = imageUrls[index];
              final bgColor = _dominantColors[imageUrl] ?? Colors.black;

              return LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const CircularProgressIndicator();
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),

        // 👇 Dot indicators
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageUrls.asMap().entries.map((entry) {
              return Container(
                width: 5.0,
                height: 5.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? AppColors.primary.withOpacity(0.9)
                      : Colors.grey[400],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}