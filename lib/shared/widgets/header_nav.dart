import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/menu_button.dart';

class HeaderNav extends StatefulWidget {
  final String titleText;

  const HeaderNav({super.key, required this.titleText});

  @override
  State<HeaderNav> createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, size: 35, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.all(0),
        ),
        // Título centrado
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              widget.titleText,
              style: const TextStyle(
                color: AppTheme.darkColor,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        MenuButton(),
      ],
    );
  }
}
