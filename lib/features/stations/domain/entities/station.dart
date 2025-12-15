import 'package:google_maps_flutter/google_maps_flutter.dart';

class Station {
  final String id;
  final String name;
  final String address;
  final LatLng location;
  final String status;           // "Abierto" / "Cerrado"
  final String openHours;        // "09:00 a 23:00"
  final int availableBatteries;
  final String image;            // URL de la imagen
  final String district;         // "Miraflores", "San Isidro", etc.

  Station({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.status,
    required this.openHours,
    required this.availableBatteries,
    required this.image,
    required this.district,
  });
}
