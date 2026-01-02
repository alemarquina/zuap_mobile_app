import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/payments/presentation/widgets/card_monthly_plan.dart';
import 'package:zuap_mobile_app/features/payments/presentation/widgets/card_yearly_plan.dart';
import 'package:zuap_mobile_app/features/payments/presentation/widgets/multi_button_selected.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

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
                  Text('Elige el plan que mejor se adapte a tí'),
                  MultiButtonSelected(
                    selectedView: _selectedView,
                    onViewChanged: _onViewChanged,
                  ),
                ],
              ),
              IndexedStack(
                index: _selectedView == PlanViewType.monthly ? 0 : 1,
                children: const [MonthlyPlansView(), YearlyPlansView()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MonthlyPlansView extends StatelessWidget {
  const MonthlyPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        CardMonthlyPlan(
          namePlan: 'Plan Eco',
          descrip: 'Ideal para usuarios ocasionales o trayectos cortos',
          price: 50,
          benefits: [
            '1 Batería activa',
            'Hasta 10 intercambios al mes',
            'Soporte estándar',
          ],
        ),
        CardMonthlyPlan(
          namePlan: 'Plan Urbano',
          descrip: 'Pensado para quienes usan el scooter a diario en la ciudad',
          price: 120,
          isPopular: true,
          benefits: [
            '1 batería activa',
            'Intercambios ilimitados',
            'Acceso prioritario a estaciones',
            'Soporte rápido',
          ],
        ),
        CardMonthlyPlan(
          namePlan: 'Plan Pro+',
          descrip: 'Perfecto para repartidores o usuarios intensivos',
          price: 199,
          benefits: [
            '2 Baterías activas',
            'Intercambios ilimitados',
            'Reemplazo inmediato',
            'Atención premium 24/7',
          ],
        ),
        CardFreeRecharge(),
        const SizedBox(height: 70,)
      ],
    );
  }
}

class YearlyPlansView extends StatelessWidget {
  const YearlyPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        CardYealyPlan(
         namePlan: 'Plan Eco',
          descrip: 'Ideal para usuarios ocasionales o trayectos cortos',
          price: 500,
          benefits: [
            '1 Batería activa',
            'Hasta 10 intercambios al mes',
            'Soporte estándar',
          ],
        ),
        CardYealyPlan(
          namePlan: 'Plan Urbano',
          descrip: 'Pensado para quienes usan el scooter a diario en la ciudad',
          price: 1300,
          isPopular: true,
          benefits: [
            '1 batería activa',
            'Intercambios ilimitados',
            'Acceso prioritario a estaciones',
            'Soporte rápido',
          ],
        ),
        CardYealyPlan(
           namePlan: 'Plan Pro+',
          descrip: 'Perfecto para repartidores o usuarios intensivos',
          price: 1800,
          benefits: [
            '2 Baterías activas',
            'Intercambios ilimitados',
            'Reemplazo inmediato',
            'Atención premium 24/7',
          ],
        ),
        CardFreeRecharge()
      ],
    );
  }
}

class CardFreeRecharge extends StatelessWidget {
  const CardFreeRecharge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recarga libre'.toUpperCase(),
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          Text('Añade saldo para realizar intercambios sin suscripción'),
          BlueButton(nameButton: 'Suscribete')
        ],
      ),
    );
  }
}