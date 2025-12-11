import 'package:zuap_mobile_app/features/battery/domain/entities/battery.dart';

abstract class BatteryRepository {
  Stream<Battery> getBatteryTelemetry();
}