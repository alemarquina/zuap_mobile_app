import 'package:equatable/equatable.dart';

/// Representación de datos para solicitar código de verificación
class GetVerificationCodeEntity extends Equatable {
  final int type;
  final String value;

  const GetVerificationCodeEntity({
    required this.type,
    required this.value,
  });

  @override
  List<Object?> get props => [
    type,
    value,
  ];
}
