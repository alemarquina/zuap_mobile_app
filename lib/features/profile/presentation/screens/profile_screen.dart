import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              HeaderNav(titleText: 'Perfil de Usuario'),
              const SizedBox(height: 45),
              SelectOptionButton(
                selectedView: _selectedView,
                onViewChanged: _onViewChanged,
              ),
              const SizedBox(height: 40),
              IndexedStack(
                index: _selectedView == ProfileViewType.usuario ? 0 : 1,
                children: const [
                  UserProfileView(),
                  MotoProfileView(),
                ],
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
                height: 80,
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
                height: 80,
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
  late TextEditingController _correoController;
  late TextEditingController _nombresController;
  late TextEditingController _apellidosController;
  late TextEditingController _telefonoController;
  late TextEditingController _tipoDocController;

  @override
  void initState() {
    super.initState();
    _correoController = TextEditingController();
    _nombresController = TextEditingController();
    _apellidosController = TextEditingController();
    _telefonoController = TextEditingController();
    _tipoDocController = TextEditingController();
  }

  @override
  void dispose() {
    _correoController.dispose();
    _nombresController.dispose();
    _apellidosController.dispose();
    _telefonoController.dispose();
    _tipoDocController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 210,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
        const SizedBox(height: 40),
        CustTextField(
          labelText: 'Correo',
          controller: _correoController,
        ),
        const SizedBox(height: 30),
        CustTextField(
          labelText: 'Nombres',
          controller: _nombresController,
        ),
        const SizedBox(height: 30),
        CustTextField(
          labelText: 'Apellidos',
          controller: _apellidosController,
        ),
        const SizedBox(height: 30),
        CustTextField(
          labelText: 'Telefono',
          controller: _telefonoController,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 30),
        CustTextField(
          labelText: 'Tipo de documento',
          controller: _tipoDocController,
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
    _modeloController = TextEditingController();
    _matriculaController = TextEditingController();
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
      children: [
        Container(
          width: 210,
          height: 210,
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
                return const Icon(Icons.two_wheeler, size: 100, color: Colors.grey);
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        CustTextField(
          labelText: 'Modelo',
          controller: _modeloController,
        ),
        const SizedBox(height: 30),
        CustTextField(
          labelText: 'Matrícula',
          controller: _matriculaController,
        ),
        const SizedBox(height: 40),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppTheme.primaryColor, width: 2),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              'Editar perfil',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
