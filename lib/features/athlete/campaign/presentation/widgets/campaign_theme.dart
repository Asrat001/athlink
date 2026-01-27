import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MultiColorPiePainter extends CustomPainter {
  final List<CostItem> items;
  final double total;
  final bool showLabels;

  MultiColorPiePainter({
    required this.items,
    required this.total,
    this.showLabels = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    // 1. Draw the Background Track (The dark ring seen in image_dbf70d.png)
    final trackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth =
          14 // Increased width to match image_207895.png
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withOpacity(0.05); // Subtle dark track

    canvas.drawCircle(center, radius, trackPaint);

    // 2. Handle Empty State (Match image_dbf70d.png)
    // Check if list is empty or all amounts are zero
    bool isEmpty = items.isEmpty || items.every((e) => e.amount <= 0);

    if (isEmpty) {
      final dotPaint = Paint()
        ..color =
            const Color(0xFFF0934F) // Specific Orange from image_dbf70d.png
        ..style = PaintingStyle.fill;

      // Draw dot at exactly the bottom (90 degrees or math.pi / 2)
      canvas.drawCircle(
        Offset(center.dx, center.dy + radius),
        5, // Slightly larger dot for visibility
        dotPaint,
      );
      return;
    }

    // 3. Draw Active Cost Segments
    double startAngle = -math.pi / 2;
    final segmentPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    for (var item in items) {
      if (item.amount <= 0) continue;

      segmentPaint.color = item.color;
      // Calculate ratio against total budget
      double sweepAngle = (item.amount / total) * 2 * math.pi;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        segmentPaint,
      );

      // 4. Draw Percentage Labels (Inside segment as per image_e5dc77.png)
      if (showLabels && (item.amount / total) > 0.05) {
        double labelAngle = startAngle + sweepAngle / 2;
        double labelRadius = radius * 0.7; // Position text inside the arc
        Offset labelOffset = Offset(
          center.dx + labelRadius * math.cos(labelAngle),
          center.dy + labelRadius * math.sin(labelAngle),
        );
        _drawCenteredText(
          canvas,
          labelOffset,
          "${((item.amount / total) * 100).toInt()}%",
          item.color,
        );
      }
      startAngle += sweepAngle;
    }
  }

  void _drawCenteredText(
    Canvas canvas,
    Offset offset,
    String text,
    Color color,
  ) {
    final tp = TextPainter(
      text: TextSpan(
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        text: text,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, offset - Offset(tp.width / 2, tp.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
