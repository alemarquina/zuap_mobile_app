import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/features/auth/domain/entities/register_form_options.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_dropdown.dart';
import 'package:zuap_mobile_app/shared/widgets/custom_text_field.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

enum ProfileViewType { usuario, moto }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileViewType _selectedView = ProfileViewType.usuario;

  void _onViewChanged(ProfileViewType viewType) {
    setState(() {
      _selectedView = viewType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            spacing: 30,
            children: [
              HeaderNav(titleText: 'Perfil de Usuario'),
              SelectOptionButton(
                selectedView: _selectedView,
                onViewChanged: _onViewChanged,
              ),
              IndexedStack(
                index: _selectedView == ProfileViewType.usuario ? 0 : 1,
                children: const [UserProfileView(), MotoProfileView()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectOptionButton extends StatelessWidget {
  final ProfileViewType selectedView;
  final Function(ProfileViewType) onViewChanged;

  const SelectOptionButton({
    super.key,
    required this.selectedView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppTheme.primaryColor, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onViewChanged(ProfileViewType.usuario),
              splashColor: AppTheme.bgColor,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(50),
                    bottomStart: Radius.circular(50),
                  ),
                  color: selectedView == ProfileViewType.usuario
                      ? AppTheme.primaryColor
                      : Colors.white,
                ),
                child: Center(
                  child: Text(
                    'USUARIO',
                    style: TextStyle(
                      color: selectedView == ProfileViewType.usuario
                          ? Colors.white
                          : AppTheme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onViewChanged(ProfileViewType.moto),
              splashColor: AppTheme.bgColor,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(50),
                    bottomEnd: Radius.circular(50),
                  ),
                  color: selectedView == ProfileViewType.moto
                      ? AppTheme.primaryColor
                      : Colors.white,
                ),
                child: Center(
                  child: Text(
                    'MOTO',
                    style: TextStyle(
                      color: selectedView == ProfileViewType.moto
                          ? Colors.white
                          : AppTheme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  String? _selectedDocument;
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _numPhoneController;
  late TextEditingController _tipoDocController;
  late TextEditingController _numDocController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(
      text: 'juliancasablancas@gmail.com',
    );
    _nameController = TextEditingController(text: 'Julian');
    _surnameController = TextEditingController(text: 'Casablancas');
    _numPhoneController = TextEditingController(text: '23232323');
    _tipoDocController = TextEditingController();
    _numDocController = TextEditingController(text: '99949343');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _numPhoneController.dispose();
    _tipoDocController.dispose();
    _numDocController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Container(
          width: 210,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: ClipOval(
            child: Image.network(
              'https://cdn.filestackcontent.com/gVx98UWFQaKBWTGAjZD7',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.person, size: 100, color: Colors.grey);
              },
            ),
          ),
        ),
        Column(
          spacing: 25,
          children: [
            CustTextField(
              labelText: 'Correo',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            CustTextField(labelText: 'Nombres', controller: _nameController),
            CustTextField(
              labelText: 'Apellidos',
              controller: _surnameController,
            ),
            CustTextField(
              labelText: 'Telefono',
              controller: _numPhoneController,
              keyboardType: TextInputType.phone,
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
              labelText: 'N° Documento',
              controller: _numDocController,
            ),
            BlueButton(nameButton: 'Editar Perfil'),
          ],
        ),
      ],
    );
  }
}

class MotoProfileView extends StatefulWidget {
  const MotoProfileView({super.key});

  @override
  State<MotoProfileView> createState() => _MotoProfileViewState();
}

class _MotoProfileViewState extends State<MotoProfileView> {
  late TextEditingController _modeloController;
  late TextEditingController _matriculaController;

  @override
  void initState() {
    super.initState();
    _modeloController = TextEditingController(text: 'Scooter 150');
    _matriculaController = TextEditingController(text: 'A1234');
  }

  @override
  void dispose() {
    _modeloController.dispose();
    _matriculaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Container(
          width: 198,          
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipOval(
            child: Image.network(
              'https://smartmoveperu.com/wp-content/uploads/2024/11/Scooter-Electrico-Segway-ZT3-Pro-Peru.png',
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.two_wheeler,
                  size: 80,
                  color: Colors.grey,
                );
              },
            ),
          ),
        ),
        Column(
          spacing: 25,
          children: [
            CustTextField(labelText: 'Modelo', controller: _modeloController),
            CustTextField(
              labelText: 'Matrícula',
              controller: _matriculaController,
            ),
            BlueButton(nameButton: 'Editar Perfil'),
          ],
        ),
      ],
    );
  }
}
