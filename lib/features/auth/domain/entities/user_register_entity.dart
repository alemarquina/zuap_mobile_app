import 'package:equatable/equatable.dart';

/// Representación de datos necesarios para registrar un nuevo usuario
class UserRegisterEntity extends Equatable {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final int cardType;
  final String card;
  final String password;
  final String code;
  final String model;
  final String plateNumber;

  const UserRegisterEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.cardType,
    required this.card,
    required this.password,
    required this.code,
    required this.model,
    required this.plateNumber,
  });

  @override
  List<Object?> get props => [
    username,
    firstName,
    lastName,
    email,
    phone,
    cardType,
    card,
    password,
    code,
    model,
    plateNumber,
  ];
}
