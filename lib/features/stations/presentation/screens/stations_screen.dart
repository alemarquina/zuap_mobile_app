import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_card.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_text_field.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';
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

              const SizedBox(height: 30),
              // Station Cards List
              const StationCard(
                name: 'Estación Tambo',
                availableBatteries: 4,
                distance: '412 m',
                address: 'Av Libertadores 456',
                status: 'Abierto',
                schedule: 'Lunes a Domingo de 7:00 a 9:00',
                imagePath:
                    'https://www.infobae.com/new-resizer/o277JOptGR4y5QwKI08RN0f02AI=/arc-anglerfish-arc2-prod-infobae/public/GT4DF2PS7NA6VJ5JZBRGIJ3G44.jpg',
              ),

              const SizedBox(height: 15),

              const StationCard(
                name: 'Estación Primax',
                availableBatteries: 2,
                distance: '1.7 Km',
                address: 'Av. Javier Prado 1234',
                status: 'Abierto',
                schedule: '24 Horas',
                imagePath:
                    'https://agesp.org.pe/wp-content/uploads/2023/10/primax.jpg',
              ),
              const SizedBox(height: 15),
              const StationCard(
                name: 'Estación Petroperú',
                availableBatteries: 10,
                distance: '2.4 Km',
                address: 'Av. La Marina 500',
                status: 'Cerrado',
                schedule: 'Lunes a Domingo de 12:00 a 23:00',
                imagePath:
                    'https://www.petroperu.com.pe/Docs/spa/images/productos/cliente_grifos.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
