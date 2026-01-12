import 'package:zuap_mobile_app/features/stations/domain/entities/nearby_station_entity.dart';

/// Modelo de datos de una estación cercana según API
class NearbyStationModel extends NearbyStationEntity {
  const NearbyStationModel({
    required super.stationId,
    required super.stationName,
    required super.availableBatteries,
    required super.operationTime,
    required super.latitude,
    required super.longitude,
    required super.distance,
  });

  factory NearbyStationModel.fromJson(Map<String, dynamic> json) {
    return NearbyStationModel(
      stationId: json['stationId'] as String,
      stationName: json['stationName'] as String,
      availableBatteries: json['availableBatteries'] as String,
      operationTime: json['operationTime'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      distance: json['distance'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stationId': stationId,
      'stationName': stationName,
      'availableBatteries': availableBatteries,
      'operationTime': operationTime,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
    };
  }

  NearbyStationModel copyWith({
    String? stationId,
    String? stationName,
    String? availableBatteries,
    String? operationTime,
    String? latitude,
    String? longitude,
    String? distance,
  }) {
    return NearbyStationModel(
      stationId: stationId ?? this.stationId,
      stationName: stationName ?? this.stationName,
      availableBatteries: availableBatteries ?? this.availableBatteries,
      operationTime: operationTime ?? this.operationTime,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distance: distance ?? this.distance,
    );
  }
}
