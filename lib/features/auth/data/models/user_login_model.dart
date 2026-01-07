import 'package:zuap_mobile_app/features/auth/domain/entities/user_login_entity.dart';

/// Modelo de datos para el inicio de sesión de usuario
class UserLoginModel extends UserLoginEntity {
  const UserLoginModel({
    required super.username,
    required super.password,
  });
  
  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
  
  UserLoginModel copyWith({
    String? username,
    String? password,
  }) {
    return UserLoginModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
