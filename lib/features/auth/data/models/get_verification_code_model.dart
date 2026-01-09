import 'package:zuap_mobile_app/features/auth/domain/entities/get_verification_code_entity.dart';

/// Modelo de datos para solicitar código de verificación
class GetVerificationCodeModel extends GetVerificationCodeEntity {
  const GetVerificationCodeModel({
    required super.type,
    required super.value,
  });

  factory GetVerificationCodeModel.fromJson(Map<String, dynamic> json) {
    return GetVerificationCodeModel(
      type: json['type'] as int,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }

  GetVerificationCodeModel copyWith({
    int? type,
    String? value,
  }) {
    return GetVerificationCodeModel(
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }
}
