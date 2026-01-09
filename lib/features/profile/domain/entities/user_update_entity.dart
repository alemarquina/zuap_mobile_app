import 'package:equatable/equatable.dart';

/// Representación de datos para actualizar información del usuario
class UserUpdateEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final int cardType;
  final String card;
  final String avatar;

  const UserUpdateEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.cardType,
    required this.card,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    phone,
    cardType,
    card,
    avatar,
  ];
}
