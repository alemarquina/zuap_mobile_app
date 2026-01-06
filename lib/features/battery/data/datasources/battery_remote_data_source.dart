import 'dart:async';
import 'package:zuap_mobile_app/features/battery/data/models/battery_model.dart';

abstract class BatteryRemoteDataSource {
  Stream<BatteryModel> getBatteryStream();
}

class BatteryMockDataSource implements BatteryRemoteDataSource {
  // Variable para guardar el Stream y que sea ÚNICO (Singleton)
  final StreamController<BatteryModel> _controller =
      StreamController<BatteryModel>.broadcast();
  Timer? _timer;

  BatteryMockDataSource() {
    // Simulación al crear la clase
    _startSimulation();
  }

  void _startSimulation() {
    int counter = 0;
    int hoursDiference = (32 - counter).abs();
    _timer = Timer.periodic(const Duration(seconds: 20), (timer) {
      counter++;

      // Simulamos datos cambiantes
      double charge = 0.82 - (counter * 0.01);
      if (charge < 0) charge = 0;

      final newData = BatteryModel(
        serialNumber: '#STN-0421',
        cycles: 150 + (counter ~/ 10),
        chargeLevel: charge,
        currentRangeKm: 72 + (counter * 0.5),
        timeLeft: '8:${(hoursDiference).toString().padLeft(2, '0')} h',
        totalKm: 450 + counter.toDouble(),
        estimatedSavings: 53.30 + (counter * 0.2),
        maintenanceSavings: (450 + counter.toDouble()) * 0.15, // Estimación temporal
      );

      // Enviando datos
      if (!_controller.isClosed) {
        _controller.add(newData);
      }
    });
  }

  @override
  Stream<BatteryModel> getBatteryStream() {
    return _controller.stream;
  }

  // Cerrar recursos
  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
