import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class ButtonExit extends StatefulWidget {
  const ButtonExit({super.key});

  @override
  State<ButtonExit> createState() => _ButtonExitState();
}

class _ButtonExitState extends State<ButtonExit> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.exit_to_app, size: 30, color: Colors.black),
            SizedBox(width: 8),
            Text(
              'Salir',
              style: TextStyle(
                color: AppTheme.darkColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
