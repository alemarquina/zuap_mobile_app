// lib/features/telemetry/presentation/widgets/battery_level_indicator.dart

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class BatteryLevelIndicator extends StatelessWidget {
  final double batteryLevel; // Value between 0.0 and 1.0

  const BatteryLevelIndicator({super.key, required this.batteryLevel});

  @override
  Widget build(BuildContext context) {
    final percentage = (batteryLevel * 100).toInt();

    return SizedBox(
      width: 140,
      height: 100,
      child: CustomPaint(
        painter: _CircularProgressPainter(
          progress: batteryLevel,
          progressColor: AppTheme.primaryColor,
          backgroundColor: const Color(0xFFE5E7EB),
          strokeWidth: 15,
        ),
        child: Center(
          child: Text(
            '$percentage%',
            style: const TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom painter for the circular progress indicator
class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2.5;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
