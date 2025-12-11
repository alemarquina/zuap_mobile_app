import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/features/battery/domain/repositories/battery_repository.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_state.dart';

/// Cubit que gestiona el estado global de la batería
class BatteryCubit extends Cubit<BatteryState> {
  final BatteryRepository _repository;
  StreamSubscription? _batterySubscription;

  BatteryCubit({required BatteryRepository repository})
      : _repository = repository,
        super(const BatteryInitial()) {
    _subscribeToBatteryTelemetry();
  }
  
  void _subscribeToBatteryTelemetry() {    
    emit(const BatteryLoading());

    _batterySubscription = _repository.getBatteryTelemetry().listen(
      (battery) {        
        emit(BatteryLoaded(battery));
      },
      onError: (error) {       
        emit(BatteryError(error.toString()));
      },
    );
  }
  
  void refresh() {
    _batterySubscription?.cancel();
    _subscribeToBatteryTelemetry();
  }

  @override
  Future<void> close() {
    _batterySubscription?.cancel();
    return super.close();
  }
}
