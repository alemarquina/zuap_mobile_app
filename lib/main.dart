import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuap_mobile_app/core/routes/app_routes.dart';
import 'package:zuap_mobile_app/features/battery/presentation/cubit/battery_cubit.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'core/di/injection_container.dart' as di;

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BatteryCubit>(
          create: (context) => di.sl<BatteryCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Zuap Mobile App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeZuap,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,      
      ),
    );
  }
}
