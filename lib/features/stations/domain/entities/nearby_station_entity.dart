import 'package:equatable/equatable.dart';

/// Representación de datos de una estación cercana según API
class NearbyStationEntity extends Equatable {
  final String stationId;
  final String stationName;
  final String availableBatteries;
  final String operationTime;
  final String latitude;
  final String longitude;
  final String distance;

  const NearbyStationEntity({
    required this.stationId,
    required this.stationName,
    required this.availableBatteries,
    required this.operationTime,
    required this.latitude,
    required this.longitude,
    required this.distance,
  });

  @override
  List<Object?> get props => [
    stationId,
    stationName,
    availableBatteries,
    operationTime,
    latitude,
    longitude,
    distance,
  ];
}
