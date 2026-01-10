import 'package:equatable/equatable.dart';

/// Representación de parámetros para descargar estadísticas del usuario
class UserStatisticDownloadParamsEntity extends Equatable {
  final String userId;
  final String queryType;
  final String startTime;
  final String endTime;

  const UserStatisticDownloadParamsEntity({
    required this.userId,
    required this.queryType,
    required this.startTime,
    required this.endTime,
  });

  @override
  List<Object?> get props => [
    userId,
    queryType,
    startTime,
    endTime,
  ];
}
