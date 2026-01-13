import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/auth/domain/entities/register_form_options.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/button_transparent.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_dropdown.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _numDocController = TextEditingController();
  final _plateController = TextEditingController();

  String? _selectedDocument;
  String? _selectedModelScooter;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _numDocController.dispose();
    _plateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Column(
              spacing: 40,
              children: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Colors.black,
                      ),
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
                          'Registro de Usuario',
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
                // Registro de moto
                Column(
                  spacing: 25,
                  children: [
                    CustTextField(
                      labelText: 'Correo electrónico',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),                    
                    CustTextField(
                      labelText: 'Nombres',
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                    ),                    
                    CustTextField(
                      labelText: 'Apellidos',
                      controller: _surnameController,
                      keyboardType: TextInputType.name,
                    ),                    
                    CustomDropdown(
                      labelText: 'Tipo de documento',
                      options: RegisterFormOptions.documentTypes,
                      value: _selectedDocument,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedDocument = newValue;
                        });
                      },
                    ),                    
                    CustTextField(
                      labelText: 'Número de documento',
                      controller: _numDocController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                Column(
                  spacing: 30,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          'Registro de Moto',
                          style: TextStyle(
                            color: AppTheme.darkColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),                    
                    CustomDropdown(
                      labelText: 'Modelo',
                      options: RegisterFormOptions.scooterModels,
                      value: _selectedModelScooter,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedModelScooter = newValue;
                        });
                      },
                    ),                    
                    Container(
                      padding: EdgeInsets.all(0),
                      height: 340,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/scooter_1.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),                    
                    CustTextField(
                      labelText: 'Número de placa',
                      controller: _plateController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),                
                // Botón Registrate
                ButtonTransparent(
                  nameButton: 'Registrase',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
