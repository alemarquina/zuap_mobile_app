import 'package:zuap_mobile_app/features/notif/domain/entities/notification_type.dart';

/// Entidad de dominio para las notificaciones
class NotificationEntity {
  final String id;
  final NotificationType type;
  final String title;
  final String description;
  final String? actionText; // Opcional: texto del botón de acción (ej: "Ver Planes")
  final String? actionUrl; // Opcional: URL o ruta para la acción
  final DateTime createdAt;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    this.actionText,
    this.actionUrl,
    required this.createdAt,
    this.isRead = false,
  });

  /// Verifica si la notificación tiene una acción asociada
  bool get hasAction => actionText != null && actionText!.isNotEmpty;

  NotificationEntity copyWith({
    String? id,
    NotificationType? type,
    String? title,
    String? description,
    String? actionText,
    String? actionUrl,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return NotificationEntity(
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationEntity &&
        other.id == id &&
        other.type == type &&
        other.title == title &&
        other.description == description &&
        other.actionText == actionText &&
        other.actionUrl == actionUrl &&
        other.createdAt == createdAt &&
        other.isRead == isRead;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        title.hashCode ^
        description.hashCode ^
        actionText.hashCode ^
        actionUrl.hashCode ^
        createdAt.hashCode ^
        isRead.hashCode;
  }

  @override
  String toString() {
    return 'NotificationEntity(id: $id, type: $type, title: $title, description: $description, actionText: $actionText, actionUrl: $actionUrl, createdAt: $createdAt, isRead: $isRead)';
  }
}
