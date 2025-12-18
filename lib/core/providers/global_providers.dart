import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/core/di/injection_container.dart' as di;
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_cubit.dart';
import 'package:zuap_mobile_app/features/notif/presentation/cubit/notifications_cubit.dart';
import 'package:zuap_mobile_app/features/stations/presentation/cubit/station_cubit.dart';

class GlobalProviders extends StatelessWidget {
  final Widget child;

  const GlobalProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BatteryCubit>(create: (_) => di.sl<BatteryCubit>()),
        BlocProvider<StationCubit>(create: (_) => di.sl<StationCubit>()),
        BlocProvider<NotificationsCubit>(create: (_) => di.sl<NotificationsCubit>())
      ],
      child: child,
    );
  }
}
