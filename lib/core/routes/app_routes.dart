import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/auth/presentation/splash_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/login_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/register_screen.dart';
import 'package:zuap_mobile_app/features/auth/presentation/forgotten_password.dart';
import 'package:zuap_mobile_app/features/battery/presentation/battery_details_screen.dart';
import 'package:zuap_mobile_app/features/info/presentation/screens/about_us_screen.dart';
import 'package:zuap_mobile_app/features/notif/presentation/screens/notifications_screen.dart';
import 'package:zuap_mobile_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:zuap_mobile_app/features/profile/presentation/screens/user_screen.dart';
import 'package:zuap_mobile_app/features/stations/domain/entities/station.dart';
import 'package:zuap_mobile_app/features/stations/presentation/screens/home_map_screen.dart';
import 'package:zuap_mobile_app/features/stations/presentation/screens/stations_screen.dart';
import 'package:zuap_mobile_app/features/stations/presentation/widgets/station_details.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String homeMapScreen = '/home_map_screen';
  static const String stationsListScreen = '/stations_list_screen';
  static const String stationDetailsScreen = '/station_details_screen';
  static const String batteryDetailsScreen = '/battery_details_screen';
  static const String userProfileScreen = '/user_profile_screen';
  static const String notificactionsScreen = '/notifications_screen';
  static const String aboutUsScreen = '/about_us_screen';
  static const String profileScreen = '/profile_screen';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    resetPasswordScreen: (context) => const ForgottenPassword(),
    homeMapScreen: (context) => const HomeMapScreen(),
    stationsListScreen: (context) => const StationScreen(),
    stationDetailsScreen: (context) {
      final station = ModalRoute.of(context)?.settings.arguments as Station?;
      if (station == null) {
        // Si no se proporciona ninguna estación, navegue hacia atrás o muestre el error
        Navigator.of(context).pop();
        return const SizedBox.shrink();
      }
      return StationDetails(station: station);
    },
    batteryDetailsScreen: (context) => const BatteryDetailsScreen(),
    userProfileScreen: (context) => const UserScreen(),
    notificactionsScreen: (context) => const NotificationsScreen(),
    aboutUsScreen: (context) => const AboutUsScreen(),
    profileScreen: (context) => const ProfileScreen()
  };
}
