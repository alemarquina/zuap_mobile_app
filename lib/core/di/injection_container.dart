import 'package:get_it/get_it.dart';
import 'package:zuap_mobile_app/features/battery/data/datasources/battery_remote_data_source.dart';
import 'package:zuap_mobile_app/features/battery/data/repositories/battery_repository_impl.dart';
import 'package:zuap_mobile_app/features/battery/domain/repositories/battery_repository.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_cubit.dart';
import 'package:zuap_mobile_app/features/notif/data/datasources/notification_data_source.dart';
import 'package:zuap_mobile_app/features/notif/data/repositories/notification_repository_impl.dart';
import 'package:zuap_mobile_app/features/notif/domain/repositories/notification_repository.dart';
import 'package:zuap_mobile_app/features/notif/presentation/cubit/notifications_cubit.dart';
import 'package:zuap_mobile_app/features/stations/data/datasources/station_remote_data_source.dart';
import 'package:zuap_mobile_app/features/stations/data/repositories/station_repository_impl.dart';
import 'package:zuap_mobile_app/features/stations/domain/repositories/station_repository.dart';
import 'package:zuap_mobile_app/features/stations/presentation/cubit/station_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  // ========== Feature Battery ==========

  sl.registerFactory<BatteryCubit>(
    () => BatteryCubit(repository: sl())
  );

  sl.registerLazySingleton<BatteryRepository>(
    () => BatteryRepositoryImpl(dataSource: sl())
  );
  
  // Datos ficticios (mock)  
  sl.registerLazySingleton<BatteryRemoteDataSource>(
    () => BatteryMockDataSource()
  );

  // ========== Feature Stations ==========

  sl.registerFactory<StationCubit>(
    () => StationCubit(repository: sl())
  );

  sl.registerLazySingleton<StationRepository>(
    () => StationRepositoryImpl(dataSource: sl())
  );

  // Datos ficticios (mock)
  sl.registerLazySingleton<StationRemoteDataSource>(
    () => StationMockDataSource()
  );

  // ========== Feature Notifications ==========

  sl.registerFactory<NotificationsCubit>(
    () => NotificationsCubit(repository: sl())
  );

  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(dataSource: sl())
  );

  // Datos ficticios (mock)
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationMockDataSource()
  );
}
