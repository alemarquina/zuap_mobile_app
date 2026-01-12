import 'package:equatable/equatable.dart';

/// Representación de datos completos de la batería según API
class BatteryDetailsEntity extends Equatable {
  final String batteryId;
  final String shortCode;
  final String soc;
  final String cyclesNum;
  final String batteryTraveledMileage;
  final String batteryUsageTime;
  final String savedMoney;
  final String temperature;
  final BatteryDetailsInfo details;

  const BatteryDetailsEntity({
    required this.batteryId,
    required this.shortCode,
    required this.soc,
    required this.cyclesNum,
    required this.batteryTraveledMileage,
    required this.batteryUsageTime,
    required this.savedMoney,
    required this.temperature,
    required this.details,
  });

  @override
  List<Object?> get props => [
    batteryId,
    shortCode,
    soc,
    cyclesNum,
    batteryTraveledMileage,
    batteryUsageTime,
    savedMoney,
    temperature,
    details,
  ];
}

/// Detalles adicionales de la batería (sub-objeto)
class BatteryDetailsInfo extends Equatable {
  final String traveledMileage;
  final String savedMoney;

  const BatteryDetailsInfo({
    required this.traveledMileage,
    required this.savedMoney,
  });

  @override
  List<Object?> get props => [
    traveledMileage,
    savedMoney,
  ];
}

