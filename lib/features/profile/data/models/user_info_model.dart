import 'package:zuap_mobile_app/features/profile/domain/entities/user_info_entity.dart';

/// Modelo de datos para la información del usuario
class UserInfoModel extends UserInfoEntity {
  const UserInfoModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.username,
    required super.email,
    required super.phone,
    required super.cardType,
    required super.card,
    required super.avatar,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      cardType: json['cardType'] as int,
      card: json['card'] as String,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phone': phone,
      'cardType': cardType,
      'card': card,
      'avatar': avatar,
    };
  }

  UserInfoModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phone,
    int? cardType,
    String? card,
    String? avatar,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cardType: cardType ?? this.cardType,
      card: card ?? this.card,
      avatar: avatar ?? this.avatar,
    );
  }
}
