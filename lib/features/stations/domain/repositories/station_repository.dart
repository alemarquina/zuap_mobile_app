import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';

abstract class StationRepository {
  Future<List<Station>> getStations();
}
