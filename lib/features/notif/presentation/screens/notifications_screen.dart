import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/core/di/injection_container.dart';
import 'package:zuap_mobile_app/features/notif/presentation/cubit/notifications_cubit.dart';
import 'package:zuap_mobile_app/features/notif/presentation/cubit/notifications_state.dart';
import 'package:zuap_mobile_app/features/notif/presentation/widgets/card_notif.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationsCubit>()..loadNotifications(),
      child: AppScaffold(
        backgroundColor: AppTheme.bgColor,
        body: SafeArea(
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),
                children: [
                  const HeaderNav(titleText: 'Notificaciones'),
                  const SizedBox(height: 35),

                  // Handle different states
                  if (state is NotificationsLoading)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (state is NotificationsError)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Error al cargar notificaciones',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.message,
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<NotificationsCubit>()
                                    .refreshNotifications();
                              },
                              child: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      ),
                    )
                  else if (state is NotificationsLoaded)
                    ...state.notifications.map((notification) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CardNotif(
                          notification: notification,
                          onTap: () {
                            debugPrint(
                              'Notificación tapped: ${notification.id}',
                            );
                          },
                          onActionTap: notification.hasAction
                              ? () {
                                  debugPrint(
                                    'Action tapped: ${notification.actionUrl}',
                                  );
                                }
                              : null,
                        ),
                      );
                    })
                  else
                    const SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
