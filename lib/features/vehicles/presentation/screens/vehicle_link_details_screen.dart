// lib/features/vehicles/presentation/screens/vehicle_link_details_screen.dart

import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class VehicleLinkDetailsScreen extends StatefulWidget {
  const VehicleLinkDetailsScreen({super.key});

  @override
  State<VehicleLinkDetailsScreen> createState() =>
      _VehicleLinkDetailsScreenState();
}

class _VehicleLinkDetailsScreenState extends State<VehicleLinkDetailsScreen> {
  bool isLinkActive = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              spacing: 20,
              children: [
                HeaderNav(titleText: 'Empresa vinculada'),
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Company Logo
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE31837),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            'M',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFFC72C),
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Company Name
                      const Text(
                        'McDonald´s',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.darkColor,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Branch Info
                      _buildInfoRow('Sucursal', 'Av. La Marina'),
                      const SizedBox(height: 20),

                      // Link Date
                      _buildInfoRow('Fecha de vinculación', '23 / 12 / 2025'),
                      const SizedBox(height: 20),

                      // Worker ID
                      _buildInfoRow('ID de trabajador', 'MC002'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Link Status Card
                Column(
                  spacing: 15,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Estado de la vinculación',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppTheme.darkColor,
                            ),
                          ),
                          Switch(
                            value: isLinkActive,
                            onChanged:
                                null,
                            activeColor: AppTheme.primaryColor,
                            activeTrackColor: AppTheme.primaryColor.withValues(
                              alpha: 0.5,
                            ),
                            inactiveThumbColor: Colors.grey[400],
                            inactiveTrackColor: Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _showRemoveLinkDialog(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 17,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Eliminar vinculación',
                          textAlign: TextAlign.start,
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppTheme.darkColor,
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppTheme.darkColor.withValues(alpha: 0.7),
            ),
          ),
        ),
      ],
    );
  }

  void _showRemoveLinkDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            '¿Eliminar vinculación?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          content: const Text(
            '¿Estás seguro de que deseas eliminar esta vinculación? Esta acción no se puede deshacer.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: AppTheme.darkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to previous screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Vinculación eliminada exitosamente'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
