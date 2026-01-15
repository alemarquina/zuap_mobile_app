import 'dart:core';
import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/battery/domain/entities/date_filter.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_dropdown.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';
import 'package:zuap_mobile_app/features/battery/presentation/widgets/stats_bar_chart.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String? _selectTypeDate;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 40,
              children: [
                HeaderNav(titleText: 'Estadísticas'),
                CustomDropdown(
                  labelText: 'Fecha',
                  options: DateFilter.dateFilter,
                  value: _selectTypeDate,
                  onChanged: (newValue) => {
                    setState(() {
                      _selectTypeDate = newValue;
                    }),
                  },
                ),
                CardStats(
                  numSwap: 4,
                  kmTraveled: 70,
                  hoursUse: 27,
                  coNotEmitted: 4,
                ),                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      'Ultimo Mes',
                      style: TextStyle(color: AppTheme.darkGrayColor),
                    ),
                    Text(
                      's/120',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                StatsBarChart.withAlternatingColors(
                  values: [60, 85, 45, 95, 70, 55, 80, 40, 75, 65, 50, 90],
                  primaryColor: AppTheme.primaryColor,
                  secondaryColor: AppTheme.acentoColor,
                ),                
                BlueButton(
                  nameButton: 'Descargar Reporte',
                  onPressed: () => {Navigator.pop(context)},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardStats extends StatefulWidget {
  final num numSwap;
  final num kmTraveled;
  final num hoursUse;
  final num coNotEmitted;

  const CardStats({
    super.key,
    required this.numSwap,
    required this.kmTraveled,
    required this.hoursUse,
    required this.coNotEmitted,
  });

  @override
  State<CardStats> createState() => _CardStatsState();
}

class _CardStatsState extends State<CardStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 10,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Intercambios realizados'),
              Text(
                '${widget.numSwap}',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kilometros recorridos'),
              Text(
                '${widget.kmTraveled}km',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Horas de uso'),
              Text(
                '${widget.hoursUse}',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CO2 no emitido'),
              Text(
                '${widget.coNotEmitted}kg',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
