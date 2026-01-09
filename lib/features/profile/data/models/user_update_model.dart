import 'package:zuap_mobile_app/features/profile/domain/entities/user_update_entity.dart';

/// Modelo de datos para actualizar información del usuario
class UserUpdateModel extends UserUpdateEntity {
  const UserUpdateModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.cardType,
    required super.card,
    required super.avatar,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      cardType: json['cardType'] as int,
      card: json['card'] as String,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'cardType': cardType,
      'card': card,
      'avatar': avatar,
    };
  }

  UserUpdateModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    int? cardType,
    String? card,
    String? avatar,
  }) {
    return UserUpdateModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cardType: cardType ?? this.cardType,
      card: card ?? this.card,
      avatar: avatar ?? this.avatar,
    );
  }
}
