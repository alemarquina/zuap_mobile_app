import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/battery/presentation/widgets/battery_level.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/blue_button.dart';
import 'package:zuap_mobile_app/shared/widgets/header_title.dart';

class BatteryDetailsScreen extends StatefulWidget {
  const BatteryDetailsScreen({super.key});

  @override
  State<BatteryDetailsScreen> createState() => _BatteryDetailsScreenState();
}

class _BatteryDetailsScreenState extends State<BatteryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              HeaderTitle(titleText: 'Batería'),
              SizedBox(height: 40),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Código: ',
                    style: TextStyle(
                      color: AppTheme.darkGrayColor,
                      fontSize: 22.5,
                      fontFamily: 'SourceSans3',
                    ),
                    children: [
                      TextSpan(
                        text: '#STN-0421',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nivel de batería'),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: 'Ciclos de Uso: ',
                            style: TextStyle(
                              color: AppTheme.darkGrayColor,
                              fontSize: 20,
                              fontFamily: 'SourceSans3',
                            ),
                            children: [
                              TextSpan(
                                text: '150',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    BatteryLevelIndicator(batteryLevel: 0.82),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Recorrido',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              '72 Km',
                              style: TextStyle(color: AppTheme.darkGrayColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tiempo útil',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              '8:32 h',
                              style: TextStyle(color: AppTheme.darkGrayColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Thermometer Icon
                            CustomPaint(
                              size: Size(40, 80),
                              painter: _ThermometerPainter(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detalles',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ultimo mes',
                      style: TextStyle(color: AppTheme.darkGrayColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Stats_monthly
              Column(
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'KM',
                          style: TextStyle(
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Has recorrido',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.darkGrayColor,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              '450 Km',
                              style: TextStyle(
                                color: AppTheme.darkColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 90,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ahorro estimado',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Text('vs gasolina'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Has ahorrado',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.darkGrayColor,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'S/ 53.30',
                              style: TextStyle(
                                color: AppTheme.darkColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              BlueButton(
                nameButton: 'Historial de Cambios',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom painter para dibujar el ícono del termómetro
class _ThermometerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final color = Colors.green; // Verde
    final strokeWidth = 3.0;

    final paintStroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintFill = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;
    final centerX = width / 2;

    // Dimensiones
    final bulbRadius = width * 0.35;
    final stemWidth = width * 0.35;
    final stemHeight = height - bulbRadius; // Altura hasta el centro del bulbo

    // 1. Dibujar el contorno (Stem + Bulb unidos)
    final stemRect = Rect.fromLTWH(
      centerX - stemWidth / 2,
      0,
      stemWidth,
      stemHeight,
    );

    final bulbRect = Rect.fromCircle(
      center: Offset(centerX, height - bulbRadius),
      radius: bulbRadius,
    );

    // Crear path del tallo
    final stemPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(stemRect, Radius.circular(stemWidth / 2)),
      );

    // Crear path del bulbo
    final bulbPath = Path()..addOval(bulbRect);

    // Unir ambos paths para crear el contorno continuo
    final outlinePath = Path.combine(PathOperation.union, stemPath, bulbPath);

    canvas.drawPath(outlinePath, paintStroke);

    // 2. Dibujar el líquido interno
    final padding = 6.0; // Espacio entre contorno y líquido
    final innerBulbRadius = bulbRadius - padding;
    final innerStemWidth = stemWidth - (padding * 2);

    // Altura del líquido (ejemplo: 60% lleno)
    final liquidTop = height * 0.4;

    final innerStemRect = Rect.fromLTWH(
      centerX - innerStemWidth / 2,
      liquidTop,
      innerStemWidth,
      (height - bulbRadius) - liquidTop, // Hasta el centro del bulbo
    );

    final innerBulbRect = Rect.fromCircle(
      center: Offset(centerX, height - bulbRadius),
      radius: innerBulbRadius,
    );

    final innerStemPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          innerStemRect,
          Radius.circular(innerStemWidth / 2),
        ),
      );

    final innerBulbPath = Path()..addOval(innerBulbRect);

    final liquidPath = Path.combine(
      PathOperation.union,
      innerStemPath,
      innerBulbPath,
    );

    canvas.drawPath(liquidPath, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
