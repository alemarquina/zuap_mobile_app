import 'package:equatable/equatable.dart';

/// Representación de datos para verificar código de verificación
class VerifyCodeEntity extends Equatable {
  final int type;
  final String value;
  final String code;

  const VerifyCodeEntity({
    required this.type,
    required this.value,
    required this.code,
  });

  @override
  List<Object?> get props => [
    type,
    value,
    code,
  ];
}
