import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/blue_button.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10),
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: AppTheme.darkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.all(0),
                  height: 340,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/login_banner.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    CustTextField(
                      labelText: 'Usuario',
                      controller: _userNameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 30),
                    CustTextField(
                      labelText: 'Contraseña',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.topRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppTheme.bgColor,
                          foregroundColor: AppTheme.bgColor,
                          overlayColor: AppTheme.bgColor,
                          side: BorderSide.none,
                          shadowColor: AppTheme.bgColor,
                          surfaceTintColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/reset_password_screen',
                          );
                        },
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    BlueButton(
                      nameButton: 'Iniciar Sesión',
                      routeName: '/home_map_screen',
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppTheme.bgColor,
                          minimumSize: Size(double.infinity, 67),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: BorderSide(
                              color: AppTheme.primaryColor,
                              width: 2.5,
                            ),
                          ),
                        ),
                        child: Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
