import 'package:zuap_mobile_app/features/battery/data/datasources/battery_remote_data_source.dart';
import 'package:zuap_mobile_app/features/battery/domain/entities/battery.dart';
import 'package:zuap_mobile_app/features/battery/domain/repositories/battery_repository.dart';

// Conectamos el Stream de DataSource con el Domain

class BatteryRepositoryImpl implements BatteryRepository{
  final BatteryRemoteDataSource dataSource;

  BatteryRepositoryImpl({required this.dataSource});

  @override
  Stream<Battery> getBatteryTelemetry() {
    return dataSource.getBatteryStream();
  }
}