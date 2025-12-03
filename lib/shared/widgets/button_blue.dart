import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class BlueButton extends StatelessWidget {
  final String nameButton;
  final String? routeName;
  final VoidCallback? onPressed;

  const BlueButton({
    super.key,
    required this.nameButton,
    this.routeName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else if (routeName != null && routeName!.isNotEmpty) {
            Navigator.pushNamed(context, routeName!);
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppTheme.primaryColor,
          minimumSize: Size(double.infinity, 67),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
            side: BorderSide(color: AppTheme.primaryColor, width: 2.5),
          ),
        ),
        child: Text(
          nameButton,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
