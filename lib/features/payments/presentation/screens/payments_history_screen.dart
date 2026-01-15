import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/payments/presentation/widgets/container_history_pay.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class PaymentsHistoryScreen extends StatefulWidget {
  const PaymentsHistoryScreen({super.key});

  @override
  State<PaymentsHistoryScreen> createState() => _PaymentsHistoryScreenState();
}

class _PaymentsHistoryScreenState extends State<PaymentsHistoryScreen> {
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
              HeaderNav(titleText: 'Historial de Pagos'),
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
                spacing: 15,
                children: [
                  ContainerHistoryPay(
                    station: 'Estación 01',
                    descrip: '3890 Poplar Dr.',
                    amount: 20,
                  ),
                  ContainerHistoryPay(
                    station: 'Estación 01',
                    descrip: '3890 Poplar Dr.',
                    amount: 20,
                  ),
                  ContainerHistoryPay(
                    station: 'Estación 01',
                    descrip: '3890 Poplar Dr.',
                    amount: 20,
                  ),
                  ContainerHistoryPay(
                    station: 'Estación 01',
                    descrip: '3890 Poplar Dr.',
                    amount: 20,
                  ),
                  ContainerHistoryPay(
                    station: 'Estación 01',
                    descrip: '3890 Poplar Dr.',
                    amount: 20,
                  ),
                  ContainerHistoryPay(
                    station: 'Estación 01',
                    descrip: '3890 Poplar Dr.',
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
