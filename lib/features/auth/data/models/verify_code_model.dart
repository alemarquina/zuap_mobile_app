import 'package:zuap_mobile_app/features/auth/domain/entities/verify_code_entity.dart';

/// Modelo de datos para verificar código de verificación
class VerifyCodeModel extends VerifyCodeEntity {
  const VerifyCodeModel({
    required super.type,
    required super.value,
    required super.code,
  });

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    return VerifyCodeModel(
      type: json['type'] as int,
      value: json['value'] as String,
      code: json['code'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
      'code': code,
    };
  }

  VerifyCodeModel copyWith({
    int? type,
    String? value,
    String? code,
  }) {
    return VerifyCodeModel(
      type: type ?? this.type,
      value: value ?? this.value,
      code: code ?? this.code,
    );
  }
}
