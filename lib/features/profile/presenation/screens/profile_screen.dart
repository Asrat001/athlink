import 'dart:math';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TransformationController _transformationController =
      TransformationController();

  final List<String> athleteImages = List.generate(
    20,
    (i) => "https://picsum.photos/200?random=${i + 1}",
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // ---------------- Header Section ---------------- //
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color(0xFFE6E9EF)],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          "https://picsum.photos/400/300",
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "SP Sport Agency",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        "Los Angeles, CA",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ---------------- Stats Section ---------------- //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatItem(value: "15+", label: "Sponsorship Campaigns"),
                _StatItem(value: "50+", label: "Athletes Represented"),
                _StatItem(value: "100+", label: "Global Partners"),
              ],
            ),
            const SizedBox(height: 30),

            // ---------------- Description ---------------- //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "SponsorPro is a global sports sponsorship agency connecting athletes with brands. "
                "We specialize in football, athletics, and racket sports, helping companies find the "
                "right talent for their campaigns.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),

            // ---------------- Title ---------------- //
            const Text(
              "Athletes Sponsored",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // ---------------- Apple Watch Grid ---------------- //
            SizedBox(
              height: size.height * 0.6,
              child: InteractiveViewer(
                transformationController: _transformationController,
                boundaryMargin: const EdgeInsets.all(200),
                minScale: 0.8,
                maxScale: 2.5,
                child: Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final height = constraints.maxHeight;

                      final radius = min(width, height) / 2.2;
                      final centerX = width / 2;
                      final centerY = height / 2;

                      return Stack(
                        children: [
                          for (int i = 0; i < athleteImages.length; i++)
                            _buildCircularItem(
                              i,
                              athleteImages.length,
                              radius,
                              centerX,
                              centerY,
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularItem(
    int index,
    int total,
    double radius,
    double cx,
    double cy,
  ) {
    // Create a spiral-like circular grid layout
    final angle = (index / total) * 2 * pi;
    final ring = (index ~/ 6); // which ring the item belongs to
    final rowRadius = radius * (0.3 + 0.15 * ring);
    final x = cx + rowRadius * cos(angle);
    final y = cy + rowRadius * sin(angle);

    // Scale items near center
    final dist = sqrt(pow(x - cx, 2) + pow(y - cy, 2));
    final maxDist = radius;
    final scale = 1.2 - (dist / maxDist) * 0.6; // closer = bigger

    return Positioned(
      left: x - 40,
      top: y - 40,
      child: Transform.scale(
        scale: scale,
        child: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(athleteImages[index]),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
