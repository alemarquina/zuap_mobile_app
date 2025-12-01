import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/auth/domain/entities/register_form_options.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
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
                SizedBox(height: 60),
                // Registro de moto
                Padding(
                  padding: EdgeInsetsGeometry.only(),
                  child: Column(
                    children: [
                      CustTextField(
                        labelText: 'Correo electrónico',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 30),
                      CustTextField(
                        labelText: 'Nombres',
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: 30),
                      CustTextField(
                        labelText: 'Apellidos',
                        controller: _surnameController,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: 30),
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
                      SizedBox(height: 30),
                      CustTextField(
                        labelText: 'Número de documento',
                        controller: _numDocController,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                Column(
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
                    SizedBox(height: 40),
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
                    SizedBox(height: 30),
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
                    SizedBox(height: 30),
                    CustTextField(
                      labelText: 'Número de placa',
                      controller: _plateController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                SizedBox(height: 45),
                // Botón Registrate
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
                      'Registrarse',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
