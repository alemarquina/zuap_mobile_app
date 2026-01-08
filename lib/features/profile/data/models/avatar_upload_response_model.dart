import 'package:zuap_mobile_app/features/profile/domain/entities/avatar_upload_response_entity.dart';

/// Modelo de datos para la respuesta del upload de avatar
class AvatarUploadResponseModel extends AvatarUploadResponseEntity {
  const AvatarUploadResponseModel({
    required super.userId,
    required super.avatar,
  });

  factory AvatarUploadResponseModel.fromJson(Map<String, dynamic> json) {
    return AvatarUploadResponseModel(
      userId: json['userId'] as int,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'avatar': avatar,
    };
  }

  AvatarUploadResponseModel copyWith({
    int? userId,
    String? avatar,
  }) {
    return AvatarUploadResponseModel(
      userId: userId ?? this.userId,
      avatar: avatar ?? this.avatar,
    );
  }
}
