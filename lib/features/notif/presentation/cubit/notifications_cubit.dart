import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/features/notif/domain/repositories/notification_repository.dart';
import 'package:zuap_mobile_app/features/notif/presentation/cubit/notifications_state.dart';


class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepository repository;

  NotificationsCubit({required this.repository}) : super(const NotificationsInitial());

  Future<void> loadNotifications() async {
    try {
      emit(const NotificationsLoading());
      final notifications = await repository.getNotifications();
      emit(NotificationsLoaded(notifications: notifications));
    } catch (e) {
      emit(NotificationsError(message: e.toString()));
    }
  }

  Future<void> refreshNotifications() async {
    await loadNotifications();
  }
}
