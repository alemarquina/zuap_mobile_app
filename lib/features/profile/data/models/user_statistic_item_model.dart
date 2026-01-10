import 'package:zuap_mobile_app/features/profile/domain/entities/user_statistic_item_entity.dart';

/// Modelo de datos para un item de estadística del usuario
class UserStatisticItemModel extends UserStatisticItemEntity {
  const UserStatisticItemModel({
    required super.time,
    required super.value,
  });

  factory UserStatisticItemModel.fromJson(Map<String, dynamic> json) {
    return UserStatisticItemModel(
      time: json['time'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'value': value,
    };
  }

  UserStatisticItemModel copyWith({
    String? time,
    String? value,
  }) {
    return UserStatisticItemModel(
      time: time ?? this.time,
      value: value ?? this.value,
    );
  }
}
