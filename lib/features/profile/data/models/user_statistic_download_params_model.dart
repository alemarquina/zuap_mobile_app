import 'package:zuap_mobile_app/features/profile/domain/entities/user_statistic_download_params_entity.dart';

/// Modelo de datos para parámetros de descarga de estadísticas del usuario
class UserStatisticDownloadParamsModel extends UserStatisticDownloadParamsEntity {
  const UserStatisticDownloadParamsModel({
    required super.userId,
    required super.queryType,
    required super.startTime,
    required super.endTime,
  });

  factory UserStatisticDownloadParamsModel.fromJson(Map<String, dynamic> json) {
    return UserStatisticDownloadParamsModel(
      userId: json['userId'] as String,
      queryType: json['queryType'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }

  Map<String, dynamic> toQueryParameters() {
    return {
      'userId': userId,
      'queryType': queryType,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  UserStatisticDownloadParamsModel copyWith({
    String? userId,
    String? queryType,
    String? startTime,
    String? endTime,
  }) {
    return UserStatisticDownloadParamsModel(
      userId: userId ?? this.userId,
      queryType: queryType ?? this.queryType,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
