import 'package:equatable/equatable.dart';

/// Representación de datos de respuesta del upload de avatar
class AvatarUploadResponseEntity extends Equatable {
  final int userId;
  final String avatar;

  const AvatarUploadResponseEntity({
    required this.userId,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
    userId,
    avatar,
  ];
}
