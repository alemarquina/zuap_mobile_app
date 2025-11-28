import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/core/routes/app_routes.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zuap',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
