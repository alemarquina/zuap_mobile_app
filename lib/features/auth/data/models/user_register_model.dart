import 'package:zuap_mobile_app/features/auth/domain/entities/user_register_entity.dart';

/// Modelo de datos para el registro de usuario
class UserRegisterModel extends UserRegisterEntity {
  const UserRegisterModel({
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.cardType,
    required super.card,
    required super.password,
    required super.code,
    required super.model,
    required super.plateNumber,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      cardType: json['cardType'] as int,
      card: json['card'] as String,
      password: json['password'] as String,
      code: json['code'] as String,
      model: json['model'] as String,
      plateNumber: json['plateNumber'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'cardType': cardType,
      'card': card,
      'password': password,
      'code': code,
      'model': model,
      'plateNumber': plateNumber,
    };
  }
  
  UserRegisterModel copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    int? cardType,
    String? card,
    String? password,
    String? code,
    String? model,
    String? plateNumber,
  }) {
    return UserRegisterModel(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cardType: cardType ?? this.cardType,
      card: card ?? this.card,
      password: password ?? this.password,
      code: code ?? this.code,
      model: model ?? this.model,
      plateNumber: plateNumber ?? this.plateNumber,
    );
  }
}
