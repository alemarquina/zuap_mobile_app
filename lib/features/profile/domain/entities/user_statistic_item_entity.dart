import 'package:equatable/equatable.dart';

/// Representación de un item de estadística del usuario
class UserStatisticItemEntity extends Equatable {
  final String time;
  final String value;

  const UserStatisticItemEntity({
    required this.time,
    required this.value,
  });

  @override
  List<Object?> get props => [
    time,
    value,
  ];
}
