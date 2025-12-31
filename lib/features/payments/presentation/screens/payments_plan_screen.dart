import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/payments/presentation/widgets/card_monthly_plan.dart';
import 'package:zuap_mobile_app/features/payments/presentation/widgets/card_yearly_plan.dart';
import 'package:zuap_mobile_app/features/payments/presentation/widgets/multi_button_selected.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

enum PlanViewType { monthly, yearly }

class PaymentsPlanScreen extends StatefulWidget {
  const PaymentsPlanScreen({super.key});

  @override
  State<PaymentsPlanScreen> createState() => _PaymentsPlanScreenState();
}

class _PaymentsPlanScreenState extends State<PaymentsPlanScreen> {
  PlanViewType _selectedView = PlanViewType.monthly;

  void _onViewChanged(PlanViewType viewType) {
    setState(() {
      _selectedView = viewType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(            
            spacing: 40,
            children: [
              HeaderNav(titleText: 'Planes'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Text('Elig el plan que mejor se adapte a tí'),
                  MultiButtonSelected()
                ],
              ),
              IndexedStack(
                index: _selectedView == PlanViewType.monthly ? 0 : 1,
                children:  const [CardMonthlyPlan(namePlan: 'Plan Eco', descrip: 'Ideal para usuario ocacionales o trayectos cortos', price: 50, dscrpBenefit: '1 Batería activa'), CardYealyPlan()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
