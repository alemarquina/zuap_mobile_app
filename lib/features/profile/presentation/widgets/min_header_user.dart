import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class MiniHeaderUser extends StatefulWidget {
  const MiniHeaderUser({super.key});

  @override
  State<MiniHeaderUser> createState() => _MiniHeaderUserState();
}

class _MiniHeaderUserState extends State<MiniHeaderUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.person, size: 35, color: Colors.grey),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Wade Warren',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.darkGrayColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Scooter 150',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
