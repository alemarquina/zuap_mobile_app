import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/auth/presentation/login_screen.dart';

class AppRoutes {
  static const String login = '/';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
  };
}
