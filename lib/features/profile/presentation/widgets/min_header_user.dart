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
    return InkWell(      
      onTap: () {
        Navigator.pushNamed(context, '/user_profile_screen');
      },
      child: Row(
        spacing: 15,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network('https://cdn.filestackcontent.com/gVx98UWFQaKBWTGAjZD7', width: 55),
          ),          
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
      ),
    );
  }
}
