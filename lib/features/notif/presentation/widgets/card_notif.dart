import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zuap_mobile_app/features/notif/domain/entities/notification_entity.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

/// Widget reutilizable para mostrar notificaciones
/// Acepta una entidad de notificación y callbacks opcionales para interacciones
class CardNotif extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback? onTap;
  final VoidCallback? onActionTap;

  const CardNotif({
    super.key,
    required this.notification,
    this.onTap,
    this.onActionTap,
  });

  /// Formatea la fecha en el formato: "29/10/2025 a las 10:30"
  String _formatDate(DateTime date) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');
    return '${dateFormat.format(date)} a las ${timeFormat.format(date)}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono con fondo circular
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: notification.type.iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                notification.type.icon,
                color: AppTheme.darkColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            // Contenido de la notificación
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppTheme.darkColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Descripción
                  Text(
                    notification.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.darkGrayColor,
                      height: 1.4,
                    ),
                  ),                  
                  if (notification.hasAction) ...[
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: onActionTap,
                      child: Text(
                        notification.actionText!.toUpperCase(),
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  // Fecha
                  Text(
                    _formatDate(notification.createdAt),
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.lightGrayColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
