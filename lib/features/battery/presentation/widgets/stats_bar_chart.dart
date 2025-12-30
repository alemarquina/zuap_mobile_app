import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

/// Modelo de datos para cada barra del gráfico
class ChartBarData {
  final double value;
  final Color color;
  final String? label;

  ChartBarData({
    required this.value,
    required this.color,
    this.label,
  });
}

/// Widget de gráfico de barras reutilizable para estadísticas
class StatsBarChart extends StatelessWidget {
  final List<ChartBarData> data;
  final double height;
  final double barWidth;
  final double barSpacing;
  final bool showLabels;
  final double cornerRadius;

  const StatsBarChart({
    super.key,
    required this.data,
    this.height = 190,
    this.barWidth = 20,
    this.barSpacing = 8,
    this.showLabels = false,
    this.cornerRadius = 8,
  });

  /// Constructor factory para generar datos con colores alternados
  /// Útil para comparar dos métricas o simplemente crear un patrón visual
  factory StatsBarChart.withAlternatingColors({
    required List<double> values,
    Color primaryColor = const Color(0xFF1976D2),
    Color secondaryColor = const Color(0xFF4CAF50),
    double height = 210,
    double barWidth = 22,
    double barSpacing = 14,
    bool showLabels = false,
    List<String>? labels,
  }) {
    final data = <ChartBarData>[];
    for (int i = 0; i < values.length; i++) {
      data.add(ChartBarData(
        value: values[i],
        color: i % 2 == 0 ? primaryColor : secondaryColor,
        label: labels != null && i < labels.length ? labels[i] : null,
      ));
    }
    return StatsBarChart(
      data: data,
      height: height,
      barWidth: barWidth,
      barSpacing: barSpacing,
      showLabels: showLabels,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            'No hay datos disponibles',
            style: TextStyle(color: AppTheme.darkGrayColor),
          ),
        ),
      );
    }

    // Encontrar el valor máximo para normalizar las alturas
    final maxValue = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    return Container(
      height: height,
      color: Colors.transparent,      
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: data.asMap().entries.map((entry) {
                final index = entry.key;
                final barData = entry.value;
                final normalizedHeight = maxValue > 0 
                    ? (barData.value / maxValue) * (height - 40)
                    : 0.0;

                return Padding(
                  padding: EdgeInsets.only(
                    right: index < data.length - 1 ? barSpacing : 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Barra
                      Container(
                        width: barWidth,
                        height: normalizedHeight.clamp(4.0, height - 40),
                        decoration: BoxDecoration(
                          color: barData.color,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                      ),
                      // Etiqueta opcional
                      if (showLabels && barData.label != null) ...[
                        SizedBox(height: 4),
                        Text(
                          barData.label!,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppTheme.darkGrayColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget de gráfico de barras con datos de ejemplo (para demostración)
class StatsBarChartExample extends StatelessWidget {
  const StatsBarChartExample({super.key});

  @override
  Widget build(BuildContext context) {    
    final exampleData = [
      ChartBarData(value: 60, color: AppTheme.primaryColor),
      ChartBarData(value: 85, color: AppTheme.acentoColor),
      ChartBarData(value: 45, color: AppTheme.primaryColor),
      ChartBarData(value: 95, color: AppTheme.acentoColor),
      ChartBarData(value: 70, color: AppTheme.primaryColor),
      ChartBarData(value: 55, color: AppTheme.acentoColor),
      ChartBarData(value: 80, color: AppTheme.primaryColor),
      ChartBarData(value: 40, color: AppTheme.acentoColor),
      ChartBarData(value: 75, color: AppTheme.primaryColor),
      ChartBarData(value: 65, color: AppTheme.acentoColor),
      ChartBarData(value: 50, color: AppTheme.primaryColor),
      ChartBarData(value: 90, color: AppTheme.acentoColor),
    ];

    return StatsBarChart(
      data: exampleData,
      height: 150,
      barWidth: 20,
      barSpacing: 8,
    );
  }
}
