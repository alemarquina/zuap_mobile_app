import 'package:zuap_mobile_app/features/notif/data/datasources/notification_data_source.dart';
import 'package:zuap_mobile_app/features/notif/domain/entities/notification_entity.dart';
import 'package:zuap_mobile_app/features/notif/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource dataSource;

  NotificationRepositoryImpl({required this.dataSource});

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    try {
      final notificationModels = await dataSource.getNotifications();
      
      return notificationModels;
    } catch (e) {
      rethrow;
    }
  }
}
