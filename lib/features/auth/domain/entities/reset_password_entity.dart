import 'package:equatable/equatable.dart';

/// Representación de datos necesarios para restablecer la contraseña de usuario
class ResetPasswordEntity extends Equatable {
  final String email;
  final String newPassword;
  final String repeatNewPassword;

  const ResetPasswordEntity({
    required this.email,
    required this.newPassword,
    required this.repeatNewPassword,
  });

  @override
  List<Object?> get props => [
    email,
    newPassword,
    repeatNewPassword,
  ];
}
