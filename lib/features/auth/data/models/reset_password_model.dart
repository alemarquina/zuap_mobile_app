import 'package:zuap_mobile_app/features/auth/domain/entities/reset_password_entity.dart';

/// Modelo de datos para restablecer la contraseña de usuario
class ResetPasswordModel extends ResetPasswordEntity {
  const ResetPasswordModel({
    required super.email,
    required super.newPassword,
    required super.repeatNewPassword,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      email: json['email'] as String,
      newPassword: json['newPassword'] as String,
      repeatNewPassword: json['repeatNewPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'newPassword': newPassword,
      'repeatNewPassword': repeatNewPassword,
    };
  }

  ResetPasswordModel copyWith({
    String? email,
    String? newPassword,
    String? repeatNewPassword,
  }) {
    return ResetPasswordModel(
      email: email ?? this.email,
      newPassword: newPassword ?? this.newPassword,
      repeatNewPassword: repeatNewPassword ?? this.repeatNewPassword,
    );
  }
}
