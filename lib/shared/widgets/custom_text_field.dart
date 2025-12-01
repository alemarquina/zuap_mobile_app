import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class CustTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppTheme.primaryColor,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: true,
      decoration: InputDecoration(
        focusColor: AppTheme.primaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryColor, width: 2.5),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppTheme.darkGrayColor,
          fontWeight: FontWeight.w100,
          letterSpacing: 0,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
