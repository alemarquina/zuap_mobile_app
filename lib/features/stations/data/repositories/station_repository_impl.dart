import 'package:zuap_mobile_app/features/stations/data/datasources/station_remote_data_source.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';
import 'package:zuap_mobile_app/features/stations/domain/repositories/station_repository.dart';

class StationRepositoryImpl implements StationRepository {
  final StationRemoteDataSource dataSource;

  StationRepositoryImpl({required this.dataSource});

  @override
  Future<List<Station>> getStations() async {
    return await dataSource.getStations();
  }
}
