import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';

/// Custom InfoWindow widget para mostrar información de estación
/// con diseño personalizado que coincide con la imagen de referencia
class StationInfoWindow extends StatelessWidget {
  final Station station;
  final VoidCallback onTap;

  const StationInfoWindow({
    super.key,
    required this.station,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título - Nombre de la estación
            Text(
              station.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            
            // Baterías disponibles
            Text(
              'Baterías disponibles: ${station.availableBatteries}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
            
            // Horario de atención
            Text(
              'Atención: ${station.openHours}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 6),
            
            // Link "ver más"
            const Text(
              'ver más',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black87,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
