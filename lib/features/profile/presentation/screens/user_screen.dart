import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            spacing: 20,
            children: [
              const HeaderNav(titleText: 'Usuario'),
              Container(
                width: 210,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.acentoColor, width: 3.0),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://cdn.filestackcontent.com/gVx98UWFQaKBWTGAjZD7',
                  ),
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Julian Casablancas',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    'Scooter 150',
                    style: TextStyle(color: AppTheme.primaryColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CardInfoPrimaryUser(
                      name: 'Saldo',
                      value: 50,
                      backgroundColor: AppTheme.acentoColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CardInfoPrimaryUser(
                      name: 'Puntos',
                      value: 120,
                      backgroundColor: AppTheme.secondaryColor,
                      colorText: AppTheme.primaryColor,
                      showCurrency: false,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                children: [
                  ProfileMenuTile(
                    iconName: Icons.person_outline,
                    name: 'Perfil',
                    onTap: () => {
                      Navigator.pushNamed(context, '/profile_screen'),
                    },
                  ),
                  ProfileMenuTile(
                    iconName: Icons.subtitles_outlined,
                    name: 'Mi Plan',
                    onTap: () => {Navigator.of(context)},
                  ),
                  ProfileMenuTile(
                    iconName: Icons.emoji_events_outlined,
                    name: 'Mis logros',
                    onTap: () => {
                      Navigator.pushNamed(context, '/skills_screen'),
                    },
                  ),
                  ProfileMenuTile(
                    iconName: Icons.payments_outlined,
                    name: 'Historial de pagos',
                    onTap: () => {
                      Navigator.pushNamed(context, '/payments_history_screen'),
                    },
                  ),
                  ProfileMenuTile(
                    iconName: Icons.build_circle_outlined,
                    name: 'Historial de mantenimiento',
                    onTap: () => {
                      Navigator.pushNamed(
                        context,
                        '/maintenance_history_screen',
                      ),
                    },
                  ),
                  ProfileMenuTile(
                    iconName: Icons.leaderboard_outlined,
                    name: 'Estadísticas',
                    onTap: () => {
                      Navigator.pushNamed(context, '/stats_screen'),
                    },
                  ),
                  ProfileMenuTile(
                    iconName: Icons.qr_code_outlined,
                    name: 'Vincular moto',
                    onTap: () => {
                      Navigator.pushNamed(
                        context,
                        '/vehicle_link_scanner_screen',
                      ),
                    },
                  ),
                  ProfileMenuTile(
                    iconName: Icons.settings_outlined,
                    name: 'Configuración',
                    onTap: () => {
                      Navigator.pushNamed(context, '/config_screen'),
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfoPrimaryUser extends StatelessWidget {
  final String name;
  final num value;
  final Color backgroundColor;
  final Color colorText;
  final bool showCurrency;

  const CardInfoPrimaryUser({
    super.key,
    required this.name,
    required this.value,
    required this.backgroundColor,
    this.colorText = Colors.black,
    this.showCurrency = true,
  });

  @override
  Widget build(BuildContext context) {
    final String displayValue = showCurrency ? 'S/$value' : '$value';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(displayValue, style: TextStyle(fontSize: 40, color: colorText)),
          Text(name, style: TextStyle(color: colorText, fontSize: 20)),
        ],
      ),
    );
  }
}
