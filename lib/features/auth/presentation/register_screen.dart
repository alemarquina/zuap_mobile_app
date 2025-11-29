import 'package:flutter/material.dart' hide DropdownButton;
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/dropdown_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _selectedDocument;
  String? _selectedModelScooter;

  final List<String> _docTypes = ['DNI', 'Carnét de extranjería'];
  final List<String> _scooterTypes = ['Flex 3.5X', 'Raptor 1.2'];

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
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
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
                      TextField(
                        cursorColor: AppTheme.primaryColor,
                        enabled: true,
                        decoration: InputDecoration(
                          focusColor: AppTheme.primaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Correo',
                          labelStyle: TextStyle(
                            color: AppTheme.darkGrayColor,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        cursorColor: AppTheme.primaryColor,
                        enabled: true,
                        decoration: InputDecoration(
                          focusColor: AppTheme.primaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Nombres',
                          labelStyle: TextStyle(
                            color: AppTheme.darkGrayColor,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        cursorColor: AppTheme.primaryColor,
                        enabled: true,
                        decoration: InputDecoration(
                          focusColor: AppTheme.primaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Apellidos',
                          labelStyle: TextStyle(
                            color: AppTheme.darkGrayColor,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      DropdownButton(
                        labelText: 'Tipo de documento',
                        options: _docTypes,
                        value: _selectedDocument,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedDocument = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 30),
                      TextField(
                        cursorColor: AppTheme.primaryColor,
                        enabled: true,
                        decoration: InputDecoration(
                          focusColor: AppTheme.primaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.primaryColor,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Número de Documento',
                          labelStyle: TextStyle(
                            color: AppTheme.darkGrayColor,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
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
                    DropdownButton(
                      labelText: 'Modelo',
                      options: _scooterTypes,
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
                    TextField(
                      cursorColor: AppTheme.primaryColor,
                      enabled: true,
                      decoration: InputDecoration(
                        focusColor: AppTheme.primaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.primaryColor,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'Número de placa',
                        labelStyle: TextStyle(
                          color: AppTheme.darkGrayColor,
                          letterSpacing: 0,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
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
