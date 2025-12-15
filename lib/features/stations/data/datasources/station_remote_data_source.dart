import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zuap_mobile_app/features/stations/data/models/station_model.dart';

abstract class StationRemoteDataSource {
  Future<List<StationModel>> getStations();
}

class StationMockDataSource implements StationRemoteDataSource {
  @override
  Future<List<StationModel>> getStations() async {
    // Simulamos un delay de red
    await Future.delayed(const Duration(milliseconds: 800));

    // Estaciones reales en Lima, Perú con coordenadas de Google Maps
    // Basadas en ubicaciones de Primax, Petroperú, Repsol (Para el ejemplo)
    return [
      StationModel(
        id: 'station_001',
        name: 'Primax Miraflores',
        address: 'Av. Larco 1301, Miraflores',
        location: const LatLng(-12.1200, -77.0300),
        status: 'Abierto',
        openHours: '24 Horas',
        availableBatteries: 5,
        image: 'https://agesp.org.pe/wp-content/uploads/2023/10/primax.jpg',
        district: 'Miraflores',
      ),
      StationModel(
        id: 'station_002',
        name: 'Primax San Isidro',
        address: 'Av. Javier Prado Este 492, San Isidro',
        location: const LatLng(-12.0900, -77.0350),
        status: 'Abierto',
        openHours: '06:00 a 23:00',
        availableBatteries: 3,
        image: 'https://agesp.org.pe/wp-content/uploads/2023/10/primax.jpg',
        district: 'San Isidro',
      ),
      StationModel(
        id: 'station_003',
        name: 'Petroperú La Molina',
        address: 'Av. La Molina 1563, La Molina',
        location: const LatLng(-12.0800, -76.9400),
        status: 'Abierto',
        openHours: '07:00 a 22:00',
        availableBatteries: 7,
        image: 'https://www.petroperu.com.pe/Docs/spa/images/productos/cliente_grifos.jpg',
        district: 'La Molina',
      ),
      StationModel(
        id: 'station_004',
        name: 'Repsol Surco',
        address: 'Av. Primavera 1050, Santiago de Surco',
        location: const LatLng(-12.1350, -76.9950),
        status: 'Abierto',
        openHours: '08:00 a 21:00',
        availableBatteries: 2,
        image: 'https://www.businessempresarial.com.pe/wp-content/uploads/2023/03/Repsol-Peru_-estacion-100_-autoservicio-1.jpg',
        district: 'Surco',
      ),
      StationModel(
        id: 'station_005',
        name: 'Primax Lince',
        address: 'Av. Arequipa 2450, Lince',
        location: const LatLng(-12.0850, -77.0320),
        status: 'Cerrado',
        openHours: '09:00 a 20:00',
        availableBatteries: 0,
        image: 'https://agesp.org.pe/wp-content/uploads/2023/10/primax.jpg',
        district: 'Lince',
      ),
      StationModel(
        id: 'station_006',
        name: 'Petroperú San Borja',
        address: 'Av. Aviación 2850, San Borja',
        location: const LatLng(-12.0950, -77.0050),
        status: 'Abierto',
        openHours: '24 Horas',
        availableBatteries: 8,
        image: 'https://www.petroperu.com.pe/Docs/spa/images/productos/cliente_grifos.jpg',
        district: 'San Borja',
      ),
      StationModel(
        id: 'station_007',
        name: 'Repsol Jesús María',
        address: 'Av. Brasil 2341, Jesús María',
        location: const LatLng(-12.0750, -77.0500),
        status: 'Abierto',
        openHours: '06:00 a 23:00',
        availableBatteries: 4,
        image: 'https://www.repsol.pe/content/dam/repsol-peru/imagenes/estaciones-de-servicio/estacion-repsol.jpg',
        district: 'Jesús María',
      ),
      StationModel(
        id: 'station_008',
        name: 'Primax Pueblo Libre',
        address: 'Av. La Marina 2000, Pueblo Libre',
        location: const LatLng(-12.0764, -77.0828),
        status: 'Abierto',
        openHours: '07:00 a 22:00',
        availableBatteries: 6,
        image: 'https://agesp.org.pe/wp-content/uploads/2023/10/primax.jpg',
        district: 'Pueblo Libre',
      ),
      StationModel(
        id: 'station_009',
        name: 'Petroperú Magdalena',
        address: 'Av. Brasil 1450, Magdalena del Mar',
        location: const LatLng(-12.0900, -77.0700),
        status: 'Abierto',
        openHours: '24 Horas',
        availableBatteries: 10,
        image: 'https://www.petroperu.com.pe/Docs/spa/images/productos/cliente_grifos.jpg',
        district: 'Magdalena',
      ),
      StationModel(
        id: 'station_010',
        name: 'Repsol San Miguel',
        address: 'Av. La Marina 1850, San Miguel',
        location: const LatLng(-12.0770, -77.0850),
        status: 'Cerrado',
        openHours: '10:00 a 20:00',
        availableBatteries: 0,
        image: 'https://www.repsol.pe/content/dam/repsol-peru/imagenes/estaciones-de-servicio/estacion-repsol.jpg',
        district: 'San Miguel',
      ),
    ];
  }
}
