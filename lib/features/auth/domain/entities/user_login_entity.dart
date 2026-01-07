import 'package:equatable/equatable.dart';

/// Representación de datos necesarios para el inicio de sesión de usuario
class UserLoginEntity extends Equatable {
  final String username;
  final String password;

  const UserLoginEntity({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
    username,
    password,
  ];
}
