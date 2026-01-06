import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_cubit.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_state.dart';
import 'package:zuap_mobile_app/features/battery/presentation/widgets/battery_circle_indicator.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class BatteryDetailsScreen extends StatelessWidget {
  const BatteryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: BlocBuilder<BatteryCubit, BatteryState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                children: [
                  const HeaderNav(titleText: 'Batería'),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Text(
                          'Código: ',
                          style: TextStyle(color: AppTheme.darkGrayColor),
                        ),
                        _DataOrSkeleton(
                          isLoading: state is! BatteryLoaded,
                          width: 120,
                          height: 25,
                          child: Text(
                            state is BatteryLoaded
                                ? state.battery.serialNumber
                                : '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tarjeta Nivel de Bataría
                  Container(
                    height: 160,
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
                            const Text('Nivel de batería'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text(
                                  'Ciclos de Uso: ',
                                  style: TextStyle(
                                    color: AppTheme.darkGrayColor,
                                    fontSize: 16,
                                    fontFamily: 'SourceSans3',
                                  ),
                                ),
                                _DataOrSkeleton(
                                  isLoading: state is! BatteryLoaded,
                                  width: 40,
                                  child: Text(
                                    state is BatteryLoaded
                                        ? '${state.battery.cycles}'
                                        : '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Indicador Circular
                        state is! BatteryLoaded
                            ? const SizedBox(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator(
                                  color: AppTheme.primaryColor,
                                ),
                              )
                            : BatteryCircleIndicator(
                                batteryLevel: state.battery.chargeLevel,
                                size: 120,
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Recorrido, tiempo y termómetro
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoBox(
                          'Recorrido',
                          state is BatteryLoaded
                              ? '${state.battery.currentRangeKm.toStringAsFixed(0)} Km'
                              : null,
                        ),
                        const SizedBox(width: 20),
                        _buildInfoBox(
                          'Tiempo útil',
                          state is BatteryLoaded
                              ? state.battery.timeLeft
                              : null,
                        ),
                        const SizedBox(width: 20),
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
                                Text(
                                  'Temperatura',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),                                
                                CustomPaint(
                                  size: const Size(40, 80),
                                  painter: _ThermometerPainter(),
                                ),      
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Data inferior
                  const Align(
                    alignment: Alignment.centerLeft,
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
                  const SizedBox(height: 20),

                  // Stats Mensuales
                  Column(
                    children: [
                      _buildKmWidget(
                        state is! BatteryLoaded,
                        state is BatteryLoaded ? state.battery.totalKm : null,
                      ),
                      const SizedBox(height: 20),
                      _buildSavingsWidget(
                        state is! BatteryLoaded,
                        state is BatteryLoaded
                            ? state.battery.estimatedSavings
                            : null,
                      ),
                      const SizedBox(height: 20),
                      _buildMaintenanceSavingsWidget(
                        state is! BatteryLoaded,
                        state is BatteryLoaded
                            ? state.battery.maintenanceSavings
                            : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  BlueButton(
                    nameButton: 'Historial de Cambios',
                    onPressed: () {
                      Navigator.pushNamed(context, '/history_swap_screen');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Widgets auxiliares

  Widget _buildInfoBox(String title, String? value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),            
            _DataOrSkeleton(
              isLoading: value == null,
              width: 60,
              child: Text(
                value ?? '',
                style: const TextStyle(color: AppTheme.darkGrayColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavingsWidget(bool isLoading, double? savings) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
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
              const Text(
                'Has ahorrado',
                style: TextStyle(fontSize: 12, color: AppTheme.darkGrayColor),
              ),
              const SizedBox(height: 3),
              _DataOrSkeleton(
                isLoading: isLoading,
                width: 100,
                height: 30,
                child: Text(
                  savings != null ? 'S/ ${savings.toStringAsFixed(2)}' : '',
                  style: const TextStyle(
                    color: AppTheme.darkColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMaintenanceSavingsWidget(bool isLoading, double? savings) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahorro estimado',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              Text('vs mantenimiento'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Has ahorrado',
                style: TextStyle(fontSize: 12, color: AppTheme.darkGrayColor),
              ),
              const SizedBox(height: 3),
              _DataOrSkeleton(
                isLoading: isLoading,
                width: 100,
                height: 30,
                child: Text(
                  savings != null ? 'S/ ${savings.toStringAsFixed(2)}' : '',
                  style: const TextStyle(
                    color: AppTheme.darkColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKmWidget(bool isLoading, double? totalKm) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
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
              const Text(
                'Has recorrido',
                style: TextStyle(fontSize: 12, color: AppTheme.darkGrayColor),
              ),
              const SizedBox(height: 3),
              _DataOrSkeleton(
                isLoading: isLoading,
                width: 100,
                height: 30,
                child: Text(
                  totalKm != null ? '${totalKm.toInt()} Km' : '',
                  style: const TextStyle(
                    color: AppTheme.darkColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Esqueleto de carga
class _DataOrSkeleton extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final double width;
  final double height;

  const _DataOrSkeleton({
    required this.isLoading,
    required this.child,
    this.width = 50,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

// --- THERMOMETER PAINTER ---
class _ThermometerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const color = Colors.green;
    const strokeWidth = 3.0;

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

    final bulbRadius = width * 0.35;
    final stemWidth = width * 0.35;
    final stemHeight = height - bulbRadius;

    final stemRect = Rect.fromLTWH(
      centerX - stemWidth / 2,
      14,
      stemWidth,
      stemHeight,
    );

    final bulbRect = Rect.fromCircle(
      center: Offset(centerX, height - bulbRadius),
      radius: bulbRadius,
    );

    final stemPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(stemRect, Radius.circular(stemWidth / 2)),
      );

    final bulbPath = Path()..addOval(bulbRect);
    final outlinePath = Path.combine(PathOperation.union, stemPath, bulbPath);

    canvas.drawPath(outlinePath, paintStroke);

    const padding = 6.0;
    final innerBulbRadius = bulbRadius - padding;
    final innerStemWidth = stemWidth - (padding * 2);
    final liquidTop = height * 0.4;

    final innerStemRect = Rect.fromLTWH(
      centerX - innerStemWidth / 2,
      liquidTop,
      innerStemWidth,
      (height - bulbRadius) - liquidTop,
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
