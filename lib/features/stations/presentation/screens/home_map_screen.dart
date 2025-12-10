import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/map_overlay_buttons.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_promo_banner.dart';
import 'package:zuap_mobile_app/features/battery/presentation/widgets/battery_level.dart';
import 'package:zuap_mobile_app/features/profile/presentation/widgets/savings_stats_card.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';

class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({super.key});

  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  GoogleMapController? _mapController;

  // Mapa apuntando a Perú inicialmente
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-12.0464, -77.0428), 
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false, 
              zoomControlsEnabled: false, 
              mapToolbarEnabled: false,
              compassEnabled: false,
            ),
          ),

          const Positioned(top: 50, right: 16, child: MapOverlayButtons()),

          Positioned(left: 0, right: 0, bottom: 0, child: _buildBottomPanel()),
        ],
      ),
    );
  }

  Widget _buildBottomPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Battery Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Detalles de batería',
                  style: TextStyle(
                    color: AppTheme.darkColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Inter',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/battery_details_screen');
                  },
                  child: const Text(
                    'Ver más',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Battery Level + Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Battery Level Indicator
                const BatteryLevelIndicator(
                  batteryLevel: 0.82, // 82%
                ),
                const SizedBox(width: 50),
                // Savings Stats Card
                const SavingsStatsCard(distanceKm: 72, savingsAmount: 23.50),
              ],
            ),
            const SizedBox(height: 25),
            // Promotional Banner
            StationPromoBanner(
              title: '¡Nueva estación habilitada!',
              description:
                  'Encuéntrala en Av. La Marina y obtén S/ 5 de descuento hoy.',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
