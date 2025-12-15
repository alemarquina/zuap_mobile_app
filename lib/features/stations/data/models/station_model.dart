import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';

class StationModel extends Station {
  StationModel({
    required super.id,
    required super.name,
    required super.address,
    required super.location,
    required super.status,
    required super.openHours,
    required super.availableBatteries,
    required super.image,
    required super.district,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      location: LatLng(
        (json['latitude'] as num).toDouble(),
        (json['longitude'] as num).toDouble(),
      ),
      status: json['status'],
      openHours: json['open_hours'],
      availableBatteries: json['available_batteries'],
      image: json['image'],
      district: json['district'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'latitude': location.latitude,
      'longitude': location.longitude,
      'status': status,
      'open_hours': openHours,
      'available_batteries': availableBatteries,
      'image': image,
      'district': district,
    };
  }
}
