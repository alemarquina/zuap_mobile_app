import 'package:zuap_mobile_app/features/notif/data/models/notification_model.dart';
import 'package:zuap_mobile_app/features/notif/domain/entities/notification_type.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationMockDataSource implements NotificationRemoteDataSource {
  @override
  Future<List<NotificationModel>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      NotificationModel(
        id: '1',
        type: NotificationType.subscription,
        title: 'Tu suscripción está por vencer',
        description: 'Renuévala ahora y no pierdas acceso a los módulos de intercambio.',
        actionText: 'Ver Planes',
        actionUrl: '/planes',
        createdAt: DateTime(2025, 10, 29, 10, 30),
        isRead: false,
      ),
      NotificationModel(
        id: '2',
        type: NotificationType.promotion,
        title: '¡Solo por hoy!',
        description: 'Cambia tu batería en Tambo y recibe 20% de descuento en tu próxima recarga.',
        actionText: null,
        actionUrl: null,
        createdAt: DateTime(2025, 10, 28, 16, 14),
        isRead: false,
      ),
      NotificationModel(
        id: '3',
        type: NotificationType.welcome,
        title: '¡Bienvenido a ZUAP!',
        description: 'Ya puedes cambiar tu primera batería gratis en cualquier módulo de la ciudad.',
        actionText: null,
        actionUrl: null,
        createdAt: DateTime(2025, 10, 23, 12, 20),
        isRead: true,
      ),
    ];
  }
}
