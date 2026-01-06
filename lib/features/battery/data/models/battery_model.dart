import 'package:zuap_mobile_app/features/battery/domain/entities/battery.dart';

class BatteryModel extends Battery {
  BatteryModel({
    required super.serialNumber,
    required super.cycles,
    required super.chargeLevel,
    required super.currentRangeKm,
    required super.timeLeft,
    required super.totalKm,
    required super.estimatedSavings,
    required super.maintenanceSavings
  });

  factory BatteryModel.fromJson(Map<String, dynamic> json) {    
    // Reemplazar con la lógica real cuando esté disponible
    final double tempMaintenanceSavings = json['maintenance_savings'] != null 
        ? (json['maintenance_savings'] as num).toDouble()
        : (json['total_km'] as num).toDouble() * 0.15; // Estimación temporal: S/0.15 por km
    
    return BatteryModel(
      serialNumber: json['serial_number'],
      cycles: json['cycles'],
      chargeLevel: (json['chargue_level'] as num).toDouble(),
      currentRangeKm: (json['range_km'] as num).toDouble(),
      timeLeft: json['time_left'],
      totalKm: (json['total_km'] as num).toDouble(),
      estimatedSavings: (json['savings'] as num).toDouble(),
      maintenanceSavings: tempMaintenanceSavings
    );
  }
}