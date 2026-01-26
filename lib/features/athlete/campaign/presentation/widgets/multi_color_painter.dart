// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:athlink/shared/theme/app_colors.dart';
// import 'package:athlink/shared/widgets/custom_text.dart';

// class CostItem {
//   final String title;
//   final double amount;
//   final Color color;

//   CostItem({required this.title, required this.amount, required this.color});
// }

// class MultiColorPiePainter extends CustomPainter {
//   final List<CostItem> items;
//   final double total;

//   MultiColorPiePainter({required this.items, required this.total});

//   @override
//   void paint(Canvas canvas, Size size) {
//     double startAngle = -math.pi / 2;
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8
//       ..strokeCap = StrokeCap.round;

//     // Draw background track
//     paint.color = Colors.white12;
//     canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

//     for (var item in items) {
//       if (item.amount <= 0) continue;
//       paint.color = item.color;
//       double sweepAngle = (item.amount / total) * 2 * math.pi;

//       canvas.drawArc(
//         Rect.fromLTWH(0, 0, size.width, size.height),
//         startAngle,
//         sweepAngle,
//         false,
//         paint,
//       );
//       startAngle += sweepAngle;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
