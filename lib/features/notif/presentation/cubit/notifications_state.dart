import 'package:equatable/equatable.dart';
import 'package:zuap_mobile_app/features/notif/domain/entities/notification_entity.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object?> get props => [];
}

class NotificationsInitial extends NotificationsState {
  const NotificationsInitial();
}

/// State when notifications are being loaded
class NotificationsLoading extends NotificationsState {
  const NotificationsLoading();
}

class NotificationsLoaded extends NotificationsState {
  final List<NotificationEntity> notifications;

  const NotificationsLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class NotificationsError extends NotificationsState {
  final String message;

  const NotificationsError({required this.message});

  @override
  List<Object?> get props => [message];
}
