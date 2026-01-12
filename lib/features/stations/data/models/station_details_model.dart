import 'package:zuap_mobile_app/features/stations/domain/entities/station_details_entity.dart';

/// Modelo de datos detallados de una estación según API
class StationDetailsModel extends StationDetailsEntity {
  const StationDetailsModel({
    required super.stationId,
    required super.stationName,
    required super.stationAddress,
    required super.availableBatteries,
    required super.operationTime,
    required super.latitude,
    required super.longitude,
    required super.status,
  });

  factory StationDetailsModel.fromJson(Map<String, dynamic> json) {
    return StationDetailsModel(
      stationId: json['stationId'] as String,
      stationName: json['stationName'] as String,
      stationAddress: json['stationAddress'] as String,
      availableBatteries: json['availableBatteries'] as String,
      operationTime: json['operationTime'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stationId': stationId,
      'stationName': stationName,
      'stationAddress': stationAddress,
      'availableBatteries': availableBatteries,
      'operationTime': operationTime,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
    };
  }

  StationDetailsModel copyWith({
    String? stationId,
    String? stationName,
    String? stationAddress,
    String? availableBatteries,
    String? operationTime,
    String? latitude,
    String? longitude,
    String? status,
  }) {
    return StationDetailsModel(
      stationId: stationId ?? this.stationId,
      stationName: stationName ?? this.stationName,
      stationAddress: stationAddress ?? this.stationAddress,
      availableBatteries: availableBatteries ?? this.availableBatteries,
      operationTime: operationTime ?? this.operationTime,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,
    );
  }
}
