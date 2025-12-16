import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/button_transparent.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class StationDetails extends StatelessWidget {
  final Station station;

  const StationDetails({
    super.key,
    required this.station,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderTitle(titleText: 'Estación'),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior:
                    Clip.antiAlias, // Ensure image respects border radius
                child: station.image.isNotEmpty
                    ? Image.network(
                        station.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              size: 50,
                              color: Colors.grey[400],
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                              color: AppTheme.primaryColor,
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey[400],
                        ),
                      ),
              ),
              const SizedBox(height: 30),
              Text(
                station.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.darkColor,
                ),
              ),
              const SizedBox(height: 5),
              // Address
              Text(
                station.address,
                style: TextStyle(
                  color: AppTheme.darkGrayColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),

              // Info Rows
              _buildInfoRow(
                icon: Icons.home_outlined, // Using home icon for store/status
                text: station.status,
              ),
              const SizedBox(height: 15),
              _buildInfoRow(icon: Icons.access_time, text: station.openHours),
              const SizedBox(height: 15),
              _buildInfoRow(
                icon: Icons.battery_charging_full_outlined,
                text: 'Baterias Disponibles: ${station.availableBatteries}',
              ),
              const SizedBox(height: 40),
              BlueButton(nameButton: 'Como llegar'),
              const SizedBox(height: 30),
              ButtonTransparent(nameButton: 'Reservar batería'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryColor, size: 32),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: AppTheme.darkGrayColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
