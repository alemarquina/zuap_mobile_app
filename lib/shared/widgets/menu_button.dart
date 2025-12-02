import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Abre el drawer desde la izquierda
            Scaffold.of(context).openDrawer();
          },
          borderRadius: BorderRadius.circular(25),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.more_vert,
              color: AppTheme.primaryColor,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
