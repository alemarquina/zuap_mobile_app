import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';

class CardYealyPlan extends StatefulWidget {
  final String namePlan;
  final String descrip;
  final num price;
  final List<String> benefits;
  final bool isPopular;

  const CardYealyPlan({
    super.key,
    required this.namePlan,
    required this.descrip,
    required this.price,
    required this.benefits,
    this.isPopular = false,
  });

  @override
  State<CardYealyPlan> createState() => _CardYealyPlanState();
}

class _CardYealyPlanState extends State<CardYealyPlan> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(widget.namePlan.toUpperCase(), style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 18
              ),),
              Text(widget.descrip),
              Text.rich(
                TextSpan(
                  text: 'S/ ${widget.price}', style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 37,                
                  ),
                  children: [
                    TextSpan(
                      text: '/año', style: TextStyle(
                        color: AppTheme.darkGrayColor,
                        fontSize: 16
                      )
                    )
                  ]
                ), 
              ),
              Text('Beneficios'),
              Column(
                spacing: 5,
                children: widget.benefits.map((benefit) => Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.check_circle_outline_rounded, color: AppTheme.primaryColor, size: 25),
                    Expanded(child: Text(benefit)),
                  ],
                )).toList(),
              ),
              const SizedBox(height: 10),
              BlueButton(nameButton: 'Suscribete'),
            ],
          ),
        ),
        if (widget.isPopular)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(20), bottomStart: Radius.circular(20)),
                
              ),
              child: Text(
                'POPULAR',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
