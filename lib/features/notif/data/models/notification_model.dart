import 'package:zuap_mobile_app/features/notif/domain/entities/notification_entity.dart';
import 'package:zuap_mobile_app/features/notif/domain/entities/notification_type.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.id,
    required super.type,
    required super.title,
    required super.description,
    super.actionText,
    super.actionUrl,
    required super.createdAt,
    super.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      type: NotificationType.fromString(json['type'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      actionText: json['actionText'] as String?,
      actionUrl: json['actionUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  /// Convierte el modelo a JSON (para enviar a la API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toJson(),
      'title': title,
      'description': description,
      'actionText': actionText,
      'actionUrl': actionUrl,
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
    };
  }

  /// Convierte el modelo a entidad de dominio
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      type: type,
      title: title,
      description: description,
      actionText: actionText,
      actionUrl: actionUrl,
      createdAt: createdAt,
      isRead: isRead,
    );
  }

  /// Crea un modelo desde una entidad de dominio
  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      id: entity.id,
      type: entity.type,
      title: entity.title,
      description: entity.description,
      actionText: entity.actionText,
      actionUrl: entity.actionUrl,
      createdAt: entity.createdAt,
      isRead: entity.isRead,
    );
  }

  @override
  NotificationModel copyWith({
    String? id,
    NotificationType? type,
    String? title,
    String? description,
    String? actionText,
    String? actionUrl,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      actionText: actionText ?? this.actionText,
      actionUrl: actionUrl ?? this.actionUrl,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}
