import 'dart:convert';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/career_journey_provider.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/career_journey_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

class GlobalFootprintMap extends ConsumerStatefulWidget {
  const GlobalFootprintMap({super.key});

  @override
  ConsumerState<GlobalFootprintMap> createState() => _GlobalFootprintMapState();
}

class _GlobalFootprintMapState extends ConsumerState<GlobalFootprintMap> {
  List<LatLng> roadPoints = [];
  bool isRouteLoading = false;
  final String mapboxToken = dotenv.env['MAPBOX_TOKEN']!;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localStorage = sl<LocalStorageService>();
      final user = localStorage.getUserData();
      if (user != null) {
        ref.read(careerJourneyProvider.notifier).loadCareerJourney(user.id);
      }
    });
  }

  // Fetch the actual road path from Mapbox Directions API
  Future<void> _getRoadRoute(List<LatLng> waypoints) async {
    if (waypoints.length < 2 || roadPoints.isNotEmpty) return;

    setState(() => isRouteLoading = true);

    final String coords = waypoints
        .map((p) => "${p.longitude},${p.latitude}")
        .join(';');
    final url =
        "https://api.mapbox.com/directions/v5/mapbox/driving/$coords?geometries=polyline&overview=full&access_token=$mapboxToken";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String encodedPoly = data['routes'][0]['geometry'];

        // Decode the polyline string into coordinates
        final List<List<num>> decodedCoords = decodePolyline(encodedPoly);

        setState(() {
          roadPoints = decodedCoords
              .map((c) => LatLng(c[0].toDouble(), c[1].toDouble()))
              .toList();
          isRouteLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error fetching road route: $e");
      setState(() => isRouteLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(careerJourneyProvider);

    return state.when(
      loading: () => _buildLoadingIndicator(),
      error: (msg) => const SizedBox.shrink(),
      loaded: (data) {
        final careers = data.data;
        final List<LatLng> markerPoints = [];

        for (var career in careers) {
          if (career.location != null && career.location!.contains(',')) {
            try {
              final parts = career.location!.split(',');
              final double lat = double.parse(parts[0].trim());
              final double lng = double.parse(parts[1].trim());
              markerPoints.add(LatLng(lat, lng));
            } catch (e) {
              debugPrint("Parsing error: $e");
            }
          }
        }

        if (markerPoints.isEmpty) return const SizedBox.shrink();

        // Trigger road fetching logic
        if (roadPoints.isEmpty && !isRouteLoading) {
          _getRoadRoute(markerPoints);
        }

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
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      initialCenter: markerPoints.first,
                      initialZoom: 13,
                      maxZoom: 20,
                      minZoom: 3,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/{z}/{x}/{y}?access_token=$mapboxToken",
                      ),
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            // Use roadPoints if available, otherwise fallback to straight lines
                            points: roadPoints.isNotEmpty
                                ? roadPoints
                                : markerPoints,
                            strokeWidth: 4,
                            color: AppColors.blue.withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                      MarkerLayer(
                        markers: markerPoints.map((point) {
                          final bool isCurrent = point == markerPoints.first;
                          return Marker(
                            point: point,
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.location_on,
                              color: isCurrent
                                  ? AppColors.orangeGradientEnd
                                  : AppColors.blue,
                              size: isCurrent ? 32 : 24,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  if (isRouteLoading)
                    const Center(
                      child: CircularProgressIndicator(color: AppColors.blue),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const SizedBox(
      height: 300,
      child: Center(
        child: CircularProgressIndicator(color: AppColors.orangeGradientStart),
      ),
    );
  }
}
