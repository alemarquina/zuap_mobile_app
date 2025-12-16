import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_cubit.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_state.dart';
import 'package:zuap_mobile_app/features/battery/presentation/widgets/battery_circle_indicator.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';
import 'package:zuap_mobile_app/features/stations/presentation/cubit/station_cubit.dart';
import 'package:zuap_mobile_app/features/stations/presentation/cubit/station_state.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_info_window.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/map_overlay_buttons.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_promo_banner.dart';
import 'package:zuap_mobile_app/features/profile/presentation/widgets/savings_stats_card.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';

class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({super.key});

  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  // Mapa apuntando a Perú inicialmente
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-12.0464, -77.0428),
    zoom: 14.0,
  );

  Set<Marker> _markers = {};
  GoogleMapController? _mapController;
  
  // Estado para el custom InfoWindow
  Station? _selectedStation;
  bool _showInfoWindow = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocListener<StationCubit, StationState>(
        listener: (context, state) {
          if (state is StationLoaded) {
            _updateMarkers(state.allStations);
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                markers: _markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                compassEnabled: false,
                onTap: (_) {
                  // Ocultar InfoWindow al tocar el mapa
                  setState(() {
                    _showInfoWindow = false;
                    _selectedStation = null;
                  });
                },
              ),
            ),

            // Custom InfoWindow flotante
            if (_showInfoWindow && _selectedStation != null)
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: 0,
                right: 0,
                child: Center(
                  child: StationInfoWindow(
                    station: _selectedStation!,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/station_details_screen',
                        arguments: _selectedStation,
                      );
                    },
                  ),
                ),
              ),

            const Positioned(top: 50, right: 16, child: MapOverlayButtons()),

            Positioned(left: 0, right: 0, bottom: 0, child: _buildBottomPanel()),
          ],
        ),
      ),
    );
  }

  void _updateMarkers(List<Station> stations) {
    setState(() {
      _markers = stations.map((station) {
        return Marker(
          markerId: MarkerId(station.id),
          position: station.location,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {
            setState(() {
              _selectedStation = station;
              _showInfoWindow = true;
            });
            // Animar cámara hacia la estación seleccionada
            _mapController?.animateCamera(
              CameraUpdate.newLatLng(station.location),
            );
          },
        );
      }).toSet();
    });
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
        child: BlocBuilder<BatteryCubit, BatteryState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Hedaer Detalles de Batería
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
                const SizedBox(height: 20),
                
                // Battery Level + Stats Row
                _buildBatteryStatsRow(state),
                
                const SizedBox(height: 15),
                const Divider(color: Colors.grey, thickness: 1.5),
                const SizedBox(height: 15),
                
                // Banner Estación
                StationPromoBanner(
                  title: '¡Nueva estación habilitada!',
                  description:
                      'Encuéntrala en Av. La Marina y obtén S/ 5 de descuento hoy.',
                ),
                const SizedBox(height: 25),
                const BlueButton(nameButton: 'Pagar'),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBatteryStatsRow(BatteryState state) {

    if (state is BatteryLoading || state is BatteryInitial) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      );
    }

    // Show error state
    if (state is BatteryError) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 40),
          SizedBox(width: 10),
          Text(
            'Error al cargar datos',
            style: TextStyle(color: Colors.red),
          ),
        ],
      );
    }

    if (state is BatteryLoaded) {
      final battery = state.battery;
      
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [          
          BatteryCircleIndicator(
            batteryLevel: battery.chargeLevel,
            size: 120,
          ),
          const SizedBox(width: 50),          
          SavingsStatsCard(
            distanceKm: battery.currentRangeKm,
            savingsAmount: battery.estimatedSavings,
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
