import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _useNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _useNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: AppTheme.darkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                Column(
                  children: [
                    CustTextField(
                      labelText: 'Usuario',
                      controller: _useNameController,
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
                SizedBox(height: 10),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppTheme.primaryColor,
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
                          'Iniciar Sesión',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
