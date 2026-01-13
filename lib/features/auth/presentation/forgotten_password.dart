import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_text_field.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 35),
          child: Column(
            spacing: 45,
            children: [
              Stack(
                children: [
                  IconButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Título centrado
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Olvidé mi contraseña',
                        style: TextStyle(
                          color: AppTheme.darkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),              
              Column(
                spacing: 30,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'Coloque su correo y espere el ',
                        style: TextStyle(
                          color: AppTheme.darkGrayColor,
                          fontSize: 22.5,
                          fontFamily: 'SourceSans3',
                        ),
                        children: [
                          TextSpan(
                            text: 'código de verificación',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),                  
                  CustTextField(
                    labelText: 'Correo electrónico',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),                 
                  BlueButton(
                    nameButton: 'Enviar',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
