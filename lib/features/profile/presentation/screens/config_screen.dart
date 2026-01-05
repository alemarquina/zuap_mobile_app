import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            spacing: 40,
            children: [
              const HeaderNav(titleText: 'Configuración'),
              Column(
                spacing: 20,
                children: [
                  ButtonInfoConfig(
                    name: 'Activar Notificaciones',
                    value: Switch(
                      value: _notificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _notificationsEnabled = value;
                        });
                      },
                      activeColor: AppTheme.primaryColor,
                    ),
                  ),
                  ButtonInfoConfig(name: 'Versión', value: Text('V1.1.2')),
                  ButtonInfoConfig(name: 'Idioma', value: Text('Español')),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)                        
                      ),
                      child: Text('Actualizar'),
                    ),
                  ),
                    InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)                        
                      ),
                      child: Text('Eliminar'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonInfoConfig extends StatefulWidget {
  final String name;
  final Widget? value;

  const ButtonInfoConfig({super.key, required this.name, this.value});

  @override
  State<ButtonInfoConfig> createState() => _ButtonInfoConfigState();
}

class _ButtonInfoConfigState extends State<ButtonInfoConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.name, style: const TextStyle()),
          if (widget.value != null) widget.value!,
        ],
      ),
    );
  }
}

class ActionButtonConfig extends StatefulWidget {
  final String name;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const ActionButtonConfig({
    super.key,
    required this.name,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<ActionButtonConfig> createState() => _ActionButtonConfigState();
}

class _ActionButtonConfigState extends State<ActionButtonConfig> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: widget.textColor ?? AppTheme.darkColor,
            ),
          ),
        ),
      ),
    );
  }
}
