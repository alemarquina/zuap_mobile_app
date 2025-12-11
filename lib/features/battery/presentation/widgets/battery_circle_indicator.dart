import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

/// Widget reutilizable sin estado que muestra un indicador circular del nivel de batería.
class BatteryCircleIndicator extends StatelessWidget {

  final double batteryLevel;
  
  final double size;

  const BatteryCircleIndicator({
    super.key,
    required this.batteryLevel,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (batteryLevel * 100).toInt();

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(        
        painter: _CircularProgressPainter(
          progress: batteryLevel,
          progressColor: AppTheme.primaryColor,
          backgroundColor: const Color(0xFFE5E7EB),
          strokeWidth: size * 0.12, 
        ),
        child: Center(
          child: Text(
            '$percentage%',
            style: TextStyle(
              fontSize: 30, 
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

/// Indicador de progreso circular
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

    // Dibujar círculo de fondo
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Dibujar arco de progreso
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
