import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_text_field.dart';
import 'package:zuap_mobile_app/shared/widgets/header_title.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';

class StationScreen extends StatefulWidget {
  const StationScreen({super.key});

  @override
  State<StationScreen> createState() => _StationScreenState();
}

class _StationScreenState extends State<StationScreen> {
  final _stationController = TextEditingController();

  @override
  void dispose() {
    _stationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              // Header with back button and title
              HeaderTitle(titleText: 'Estaciones'),
              const SizedBox(height: 30),
              CustTextField(
                labelText: 'Buscar estación',
                controller: _stationController,
                keyboardType: TextInputType.text,
              ),

              SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ESTACIONES CERCANAS',
                  style: TextStyle(
                    color: AppTheme.darkColor,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Station Cards List
              _buildStationCard(
                name: 'Estación Tambo',
                availableBatteries: 7,
                distance: '412 m',
              ),

              const SizedBox(height: 15),

              _buildStationCard(
                name: 'Estación Primax',
                availableBatteries: 2,
                distance: '1.7 Km',
              ),

              const SizedBox(height: 15),

              _buildStationCard(
                name: 'Estación Norkys',
                availableBatteries: 10,
                distance: '2.4 Km',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStationCard({
    required String name,
    required int availableBatteries,
    required String distance,
  }) {
    return Container(
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
            name,
            style: TextStyle(
              color: AppTheme.darkColor,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Baterías disponibles: $availableBatteries',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Distancia: $distance',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
