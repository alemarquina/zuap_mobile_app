import 'package:get_it/get_it.dart';
import 'package:zuap_mobile_app/features/battery/data/datasources/battery_remote_data_source.dart';
import 'package:zuap_mobile_app/features/battery/data/repositories/battery_repository_impl.dart';
import 'package:zuap_mobile_app/features/battery/domain/repositories/battery_repository.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  // Feature Battery
  
  // Cubit (Presentation Layer)
  sl.registerFactory<BatteryCubit>(
    () => BatteryCubit(repository: sl())
  );

  // Repository (Domain Layer)
  sl.registerLazySingleton<BatteryRepository>(
    () => BatteryRepositoryImpl(dataSource: sl())
  );
  
  // Data Source (Data Layer)
  // -Actualmente usamos Mock (ficticios)
  sl.registerLazySingleton<BatteryRemoteDataSource>(
    () => BatteryMockDataSource()
  );

  // Implementación Api
  // sl.registerLazySingleton<BatteryRemoteDataSource>(
  // () => BatteryApiDataSource());
}