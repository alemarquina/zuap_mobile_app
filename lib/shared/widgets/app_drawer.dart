// lib/shared/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/profile/presentation/widgets/header_user.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/exit_button.dart';

/// Drawer lateral reutilizable con menú de navegación
/// Ocupa la mitad del ancho de la pantalla
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        width: screenWidth * 0.50, // 65% del ancho de la pantalla
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(0),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              HeaderUserProfile(),
              SizedBox(height: 70),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: [
                    _buildMenuItem(
                      context,
                      title: 'Home',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'Batería',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'Notificaciones',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'Planes',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'Usuario',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'Historial de cambios',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'FAQ',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'Vincular moto',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      context,
                      title: 'Quienes somos',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              ButtonExit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          title,
          style: const TextStyle(
            letterSpacing: 0,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppTheme.darkColor,
          ),
        ),
      ),
    );
  }
}
