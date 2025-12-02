import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/auth/presentation/splash_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/login_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/register_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/forgotten_password.dart';
import 'package:zuap_mobile_app/features/stations/presentation/home_map_screen.dart';
import 'package:zuap_mobile_app/features/stations/presentation/station_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String homeMapScreen = '/home_map_screen';
  static const String stationScreen = '/station_screen';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    resetPasswordScreen: (context) => const ForgottenPassword(),
    homeMapScreen: (context) => const HomeMapPage(),
    stationScreen: (context) => const StationScreen(),
  };
}
