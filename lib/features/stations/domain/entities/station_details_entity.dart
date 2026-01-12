import 'package:equatable/equatable.dart';

/// Representación de datos detallados de una estación según API
class StationDetailsEntity extends Equatable {
  final String stationId;
  final String stationName;
  final String stationAddress;
  final String availableBatteries;
  final String operationTime;
  final String latitude;
  final String longitude;
  final String status;

  const StationDetailsEntity({
    required this.stationId,
    required this.stationName,
    required this.stationAddress,
    required this.availableBatteries,
    required this.operationTime,
    required this.latitude,
    required this.longitude,
    required this.status,
  });

  @override
  List<Object?> get props => [
    stationId,
    stationName,
    stationAddress,
    availableBatteries,
    operationTime,
    latitude,
    longitude,
    status,
  ];
}
