import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';

class CardMonthlyPlan extends StatefulWidget {
   
  final String namePlan;
  final String descrip;
  final num price;
  final String dscrpBenefit;


  const CardMonthlyPlan({super.key, required this.namePlan, required this.descrip, required this.price, required this.dscrpBenefit});

  @override
  State<CardMonthlyPlan> createState() => _CardMonthlyPlanState();
}

class _CardMonthlyPlanState extends State<CardMonthlyPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        spacing: 10,
        children: [
          Text(widget.namePlan),
          Text(widget.descrip),
          Text('S/ ${widget.price}/mes'),
          Text('Beneficios'),
          Column(
            spacing: 5,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  Text(widget.dscrpBenefit)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  Text(widget.dscrpBenefit)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  Text(widget.dscrpBenefit)
                ],
              )
            ],
          ),
          BlueButton(nameButton: 'Suscribete')
        ],
      ),
    );
  }
}