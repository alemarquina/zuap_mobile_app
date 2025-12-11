import 'package:equatable/equatable.dart';
import 'package:zuap_mobile_app/features/battery/domain/entities/battery.dart';

/// Clase base para todos los estados de la batería
abstract class BatteryState extends Equatable {
  const BatteryState();

  @override
  List<Object?> get props => [];
}

class BatteryInitial extends BatteryState {
  const BatteryInitial();
}

class BatteryLoading extends BatteryState {
  const BatteryLoading();
}

class BatteryLoaded extends BatteryState {
  final Battery battery;

  const BatteryLoaded(this.battery);

  @override
  List<Object?> get props => [battery];
}

class BatteryError extends BatteryState {
  final String message;

  const BatteryError(this.message);

  @override
  List<Object?> get props => [message];
}
