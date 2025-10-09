import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ImagePalette {
  /// Extracts the dominant color from a network image
  static Future<Color> getDominantColorFromNetwork(String imageUrl) async {
    try {
      final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
        size: const Size(200, 200), // Small size for performance
        maximumColorCount: 20,
      );
      return palette.dominantColor?.color ?? Colors.black;
    } catch (_) {
      return Colors.black;
    }
  }

  /// Extracts the vibrant color from a network image
  static Future<Color> getVibrantColorFromNetwork(String imageUrl) async {
    try {
      final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
        size: const Size(200, 200),
        maximumColorCount: 20,
      );
      return palette.vibrantColor?.color ?? Colors.black;
    } catch (_) {
      return Colors.black;
    }
  }

  /// Extracts dominant color from a local asset image
  static Future<Color> getDominantColorFromAsset(String assetPath) async {
    try {
      final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
        AssetImage(assetPath),
        size: const Size(200, 200),
        maximumColorCount: 20,
      );
      return palette.dominantColor?.color ?? Colors.black;
    } catch (_) {
      return Colors.black;
    }
  }
}
