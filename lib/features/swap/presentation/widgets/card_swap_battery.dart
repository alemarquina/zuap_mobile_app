import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class CardSwapBattery extends StatefulWidget {
  final String station;
  final String date;
  final String wallet;
  final String hour;

  const CardSwapBattery({
    super.key,
    required this.station,
    required this.date,
    required this.wallet,
    required this.hour,
  });

  @override
  State<CardSwapBattery> createState() => _CardSwapBatteryState();
}

class _CardSwapBatteryState extends State<CardSwapBattery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.house_outlined,
                      color: AppTheme.primaryColor,
                      size: 30,
                    ),
                    Text(widget.station),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppTheme.primaryColor,
                      size: 30,
                    ),
                    Text(widget.date),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.wallet_outlined,
                      color: AppTheme.primaryColor,
                      size: 30,
                    ),
                    Text(widget.wallet),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: AppTheme.primaryColor,
                      size: 30,
                    ),
                    Text('${widget.hour} pm'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
