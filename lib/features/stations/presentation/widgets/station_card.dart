import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_details.dart';

class StationCard extends StatefulWidget {
  final String name;
  final int availableBatteries;
  final String distance;
  // Nuevos campos para el detalle
  final String address;
  final String status;
  final String schedule;
  final String imagePath;

  const StationCard({
    super.key,
    required this.name,
    required this.availableBatteries,
    required this.distance,
    this.address = 'Av. Desconocida 123',
    this.status = 'Abierto',
    this.schedule = 'Lunes a Domingo de 7:00 a 23:00',
    this.imagePath = '',
  });

  @override
  State<StationCard> createState() => _StationCardState();
}

class _StationCardState extends State<StationCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Create a Station object from the card data
        final station = Station(
          id: 'station_${widget.name.hashCode}',
          name: widget.name,
          address: widget.address,
          location: const LatLng(-12.0464, -77.0428), // Default location
          status: widget.status,
          openHours: widget.schedule,
          availableBatteries: widget.availableBatteries,
          image: widget.imagePath,
          district: 'Lima', // Default district
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StationDetails(station: station),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                color: AppTheme.darkColor,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Baterías disponibles: ${widget.availableBatteries}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Distancia: ${widget.distance}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
