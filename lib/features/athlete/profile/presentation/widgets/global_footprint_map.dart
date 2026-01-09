import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/theme/app_colors.dart';

class GlobalFootprintMap extends StatelessWidget {
  const GlobalFootprintMap({super.key});

  final String mapboxToken =
      "pk.eyJ1Ijoicm95YWxyaWRlMjAiLCJhIjoiY21lNXJiamVlMDJvaTJqb3BncnZ2NGhhMSJ9.oIa_u0hX1FHwi2LftJbvZQ";

  @override
  Widget build(BuildContext context) {
    final List<LatLng> polylinePoints = [
      const LatLng(-8.601, 115.125),
      const LatLng(-8.602, 115.126),
      const LatLng(-8.602, 115.127),
      const LatLng(-8.600, 115.128),
      const LatLng(-8.600, 115.129),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          title: 'Global Footprint',
          fontSize: 16,
          textColor: AppColors.orangeGradientStart,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 16),
        Container(
          height: 300,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
          ),
          child: FlutterMap(
            options: MapOptions(
              initialCenter: polylinePoints.last,
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/{z}/{x}/{y}?access_token=$mapboxToken",
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: polylinePoints,
                    strokeWidth: 4,
                    color: AppColors.blue,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: polylinePoints.first,
                    child: const Icon(
                      Icons.location_on,
                      color: AppColors.orangeGradientEnd,
                      size: 30,
                    ),
                  ),
                  Marker(
                    point: polylinePoints.last,
                    child: const Icon(
                      Icons.radio_button_checked,
                      color: AppColors.blue,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
