import 'package:equatable/equatable.dart';

/// Representación de datos de información del usuario
class UserInfoEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phone;
  final int cardType;
  final String card;
  final String avatar;

  const UserInfoEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.cardType,
    required this.card,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    username,
    email,
    phone,
    cardType,
    card,
    avatar,
  ];
}
