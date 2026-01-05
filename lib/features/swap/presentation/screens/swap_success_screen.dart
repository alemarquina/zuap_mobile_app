import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class SwapSuccessScreen extends StatefulWidget {
  const SwapSuccessScreen({super.key});

  @override
  State<SwapSuccessScreen> createState() => _SwapSuccessScreenState();
}

class _SwapSuccessScreenState extends State<SwapSuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate back to home after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home_map_screen',
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Green check circle
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF7ED957),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7ED957).withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 120,
              ),
            ),
            const SizedBox(height: 40),
            // Title
            const Text(
              'Ya puedes realizar el',
              style: TextStyle(
                fontSize: 20,
                color: AppTheme.darkColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            const Text(
              'cambio de batería',
              style: TextStyle(
                fontSize: 20,
                color: AppTheme.darkColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'La estación está lista para procesar tu batería.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
