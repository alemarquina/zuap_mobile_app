import 'package:flutter/material.dart';

/// Cada tipo tiene asociado un icono y color de fondo específico
enum NotificationType {
  subscription,
  promotion,
  welcome,
  general;

  IconData get icon {
    switch (this) {
      case NotificationType.subscription:
        return Icons.notifications_outlined;
      case NotificationType.promotion:
        return Icons.campaign_outlined;
      case NotificationType.welcome:
        return Icons.waving_hand_outlined;
      case NotificationType.general:
        return Icons.info_outline;
    }
  }

  Color get iconBackgroundColor {
    switch (this) {
      case NotificationType.subscription:
        return const Color(0xFF9EFFFC); 
      case NotificationType.promotion:
        return const Color(0xFF9EFFFC); 
      case NotificationType.welcome:
        return const Color(0xFF9EFFFC); 
      case NotificationType.general:
        return const Color(0xFFE3F2FD);
    }
  }

  /// Convierte un string a NotificationType
  static NotificationType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'subscription':
        return NotificationType.subscription;
      case 'promotion':
        return NotificationType.promotion;
      case 'welcome':
        return NotificationType.welcome;
      default:
        return NotificationType.general;
    }
  }
  
  String toJson() => name;
}
