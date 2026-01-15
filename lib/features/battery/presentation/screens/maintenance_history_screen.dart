import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class MaintenanceHistoryScreen extends StatefulWidget {
  const MaintenanceHistoryScreen({super.key});

  @override
  State<MaintenanceHistoryScreen> createState() =>
      _MaintenanceHistoryScreenState();
}

class _MaintenanceHistoryScreenState extends State<MaintenanceHistoryScreen> {
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
              HeaderNav(titleText: 'Historial de mantenimiento'),
              Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Desde',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text('20/09/25 - 20/10/25'),
                  ),
                ],
              ),
              Column(
                spacing: 20,
                children: [
                  CardMaintenance(
                    walt: 'Wisteria Lane 99',
                    descrip:
                        'Lorem ipsum dolor ist amet, cosectetur adipiscing elit',
                    amount: 20,
                  ),
                  CardMaintenance(
                    walt: 'Wisteria Lane 99',
                    descrip:
                        'Lorem ipsum dolor ist amet, cosectetur adipiscing elit',
                    amount: 20,
                  ),
                  CardMaintenance(
                    walt: 'Wisteria Lane 99',
                    descrip:
                        'Lorem ipsum dolor ist amet, cosectetur adipiscing elit',
                    amount: 20,
                  ),
                  CardMaintenance(
                    walt: 'Wisteria Lane 99',
                    descrip:
                        'Lorem ipsum dolor ist amet, cosectetur adipiscing elit',
                    amount: 20,
                  ),
                  CardMaintenance(
                    walt: 'Wisteria Lane 99',
                    descrip:
                        'Lorem ipsum dolor ist amet, cosectetur adipiscing elit',
                    amount: 20,
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

class CardMaintenance extends StatefulWidget {
  final String walt;
  final String descrip;
  final double amount;

  const CardMaintenance({
    super.key,
    required this.walt,
    required this.descrip,
    required this.amount,
  });

  @override
  State<CardMaintenance> createState() => _CardMaintenanceState();
}

class _CardMaintenanceState extends State<CardMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('WALT', style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 5),
                  Text(
                    widget.walt,
                    style: TextStyle(color: AppTheme.darkGrayColor),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Total', style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 5),
                  Text(
                    'S/${widget.amount}',
                    style: TextStyle(color: AppTheme.darkGrayColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Razón', style: TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 5),
              Text(
                widget.descrip,
                style: TextStyle(color: AppTheme.darkGrayColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
