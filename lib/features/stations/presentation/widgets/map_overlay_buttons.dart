// lib/features/stations/presentation/widgets/map_overlay_buttons.dart

import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/menu_button.dart';

/// Widget that displays the floating action buttons over the map
/// (Menu button with 3 dots and Search button)
class MapOverlayButtons extends StatelessWidget {
  const MapOverlayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Menu Button (abre el drawer)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: MenuButton(),
          ),
          const SizedBox(height: 15),

          // Search Button
          _buildCircularButton(
            icon: Icons.search,
            onPressed: () {
              Navigator.pushNamed(context, '/stations_list_screen');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: AppTheme.primaryColor, size: 35),
          ),
        ),
      ),
    );
  }
}
