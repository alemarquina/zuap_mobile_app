import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/battery/domain/entities/date_filter.dart';
import 'package:zuap_mobile_app/features/swap/presentation/widgets/card_swap_battery.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_dropdown.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class HistorySwapScreen extends StatefulWidget {
  const HistorySwapScreen({super.key});

  @override
  State<HistorySwapScreen> createState() => _HistorySwapScreenState();
}

class _HistorySwapScreenState extends State<HistorySwapScreen> {
  String? _selectTypeDate;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            spacing: 35,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderNav(titleText: 'Historial de Cambios'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Text(
                    'Ultimos cambios',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
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
                ],
              ),
              Column(
                spacing: 22,
                children: [
                  CardSwapBattery(
                    station: 'Tambo Universitaria',
                    date: '24/10/205',
                    wallet: 'Yape',
                    hour: '02:34',
                  ),
                  CardSwapBattery(
                    station: 'KFC Av. La Marina',
                    date: '24/10/205',
                    wallet: 'Yape',
                    hour: '02:34',
                  ),
                  CardSwapBattery(
                    station: 'Tambo Villa',
                    date: '24/10/205',
                    wallet: 'Plan PRO',
                    hour: '02:34',
                  ),
                  CardSwapBattery(
                    station: 'Petro Perú',
                    date: '24/10/205',
                    wallet: 'PLAN PRO',
                    hour: '02:34',
                  ),
                  CardSwapBattery(
                    station: 'Shalon Aramburu',
                    date: '24/10/205',
                    wallet: 'Yape',
                    hour: '02:34',
                  ),
                  CardSwapBattery(
                    station: 'Tambo Universitaria',
                    date: '24/10/205',
                    wallet: 'Yape',
                    hour: '02:34',
                  ),
                  CardSwapBattery(
                    station: 'Tambo Universitaria',
                    date: '24/10/205',
                    wallet: 'Yape',
                    hour: '02:34',
                  ),
                  BlueButton(nameButton: 'Ver más')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
