import 'package:zuap_mobile_app/features/battery/domain/entities/battery_details_entity.dart';

/// Modelo de datos completos de la batería según API
class BatteryDetailsModel extends BatteryDetailsEntity {
  const BatteryDetailsModel({
    required super.batteryId,
    required super.shortCode,
    required super.soc,
    required super.cyclesNum,
    required super.batteryTraveledMileage,
    required super.batteryUsageTime,
    required super.savedMoney,
    required super.temperature,
    required super.details,
  });

  factory BatteryDetailsModel.fromJson(Map<String, dynamic> json) {
    return BatteryDetailsModel(
      batteryId: json['batteryId'] as String,
      shortCode: json['shortCode'] as String,
      soc: json['soc'] as String,
      cyclesNum: json['cyclesNum'] as String,
      batteryTraveledMileage: json['batteryTraveledMileage'] as String,
      batteryUsageTime: json['batteryUsageTime'] as String,
      savedMoney: json['savedMoney'] as String,
      temperature: json['temperature'] as String,
      details: BatteryDetailsInfoModel.fromJson(json['details'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'batteryId': batteryId,
      'shortCode': shortCode,
      'soc': soc,
      'cyclesNum': cyclesNum,
      'batteryTraveledMileage': batteryTraveledMileage,
      'batteryUsageTime': batteryUsageTime,
      'savedMoney': savedMoney,
      'temperature': temperature,
      'details': (details as BatteryDetailsInfoModel).toJson(),
    };
  }

  BatteryDetailsModel copyWith({
    String? batteryId,
    String? shortCode,
    String? soc,
    String? cyclesNum,
    String? batteryTraveledMileage,
    String? batteryUsageTime,
    String? savedMoney,
    String? temperature,
    BatteryDetailsInfo? details,
  }) {
    return BatteryDetailsModel(
      batteryId: batteryId ?? this.batteryId,
      shortCode: shortCode ?? this.shortCode,
      soc: soc ?? this.soc,
      cyclesNum: cyclesNum ?? this.cyclesNum,
      batteryTraveledMileage: batteryTraveledMileage ?? this.batteryTraveledMileage,
      batteryUsageTime: batteryUsageTime ?? this.batteryUsageTime,
      savedMoney: savedMoney ?? this.savedMoney,
      temperature: temperature ?? this.temperature,
      details: details ?? this.details,
    );
  }
}

/// Modelo de detalles adicionales de la batería
class BatteryDetailsInfoModel extends BatteryDetailsInfo {
  const BatteryDetailsInfoModel({
    required super.traveledMileage,
    required super.savedMoney,
  });

  factory BatteryDetailsInfoModel.fromJson(Map<String, dynamic> json) {
    return BatteryDetailsInfoModel(
      traveledMileage: json['traveledMileage'] as String,
      savedMoney: json['savedMoney'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'traveledMileage': traveledMileage,
      'savedMoney': savedMoney,
    };
  }
}

