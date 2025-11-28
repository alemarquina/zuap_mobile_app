import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/auth/presentation/login_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/register_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/reset_password_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String resetPasswordScreen = '/reset_password_screen';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    resetPasswordScreen: (context) => const ResetPasswordScreen(),
  };
}
