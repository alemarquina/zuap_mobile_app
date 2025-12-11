import 'package:zuap_mobile_app/features/battery/domain/entities/battery.dart';

class BatteryModel extends Battery {
  BatteryModel({
    required super.serialNumber,
    required super.cycles,
    required super.chargeLevel,
    required super.currentRangeKm,
    required super.timeLeft,
    required super.totalKm,
    required super.estimatedSavings
  });

  factory BatteryModel.fromJson(Map<String, dynamic> json) {
    return BatteryModel(
      serialNumber: json['serial_number'],
      cycles: json['cycles'],
      chargeLevel: (json['chargue_level'] as num).toDouble(),
      currentRangeKm: (json['range_km'] as num).toDouble(),
      timeLeft: json['time_left'],
      totalKm: (json['total_km'] as num).toDouble(),
      estimatedSavings: (json['savings'] as num).toDouble()
    );
  }
}