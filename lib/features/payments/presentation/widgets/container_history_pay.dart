import 'package:flutter/material.dart';

class ContainerHistoryPay extends StatefulWidget {
  final String station;
  final String descrip;
  final double amount;

  const ContainerHistoryPay({
    super.key,
    required this.station,
    required this.descrip,
    required this.amount,
  });

  @override
  State<ContainerHistoryPay> createState() => _ContainerHistoryPayState();
}

class _ContainerHistoryPayState extends State<ContainerHistoryPay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.station),
              const SizedBox(height: 5),
              Text(widget.descrip),
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Total'),
              const SizedBox(height: 5),
              Text('S/${widget.amount}')
            ],
          )
        ],
      ),
    );
  }
}
