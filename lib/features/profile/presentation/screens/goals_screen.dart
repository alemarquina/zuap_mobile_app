import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            spacing: 30,
            children: [
              HeaderNav(titleText: 'Mis logros'),
              Row(
                spacing: 30,
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '253',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                          Text('Puntos', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('13', style: TextStyle(fontSize: 50)),
                          Text('Medallas'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 20,
                children: [
                  ContainerGoalsUser(
                    title: 'Rider Constante',
                    descrip: '22 días seguidos usando el servicio',
                  ),
                  ContainerGoalsUser(
                    title: 'Maestro del intercambio',
                    descrip: '50 intercambios realizados',
                  ),
                  ContainerGoalsUser(
                    title: 'Guardían del bolsillo',
                    descrip: 'Ahorra de más de S/100 en energía',
                  ),
                  ContainerGoalsUser(
                    title: 'Héroe del planeta',
                    descrip:
                        'Mantuviste buena salud de batería durante 30 días',
                  ),
                  ContainerGoalsUser(
                    title: 'Explorador urbano',
                    descrip: 'Visitaste 15 estaciones distintas',
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

class ContainerGoalsUser extends StatefulWidget {
  final String title;
  final String descrip;

  const ContainerGoalsUser({
    required this.title,
    required this.descrip,
    super.key,
  });

  @override
  State<ContainerGoalsUser> createState() => _ContainerGoalsUserState();
}

class _ContainerGoalsUserState extends State<ContainerGoalsUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: TextStyle(fontWeight: FontWeight.w900)),
          Text(widget.descrip, style: TextStyle(color: AppTheme.darkGrayColor)),
        ],
      ),
    );
  }
}
