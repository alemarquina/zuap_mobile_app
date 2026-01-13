import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';

/// Modal para buscar y filtrar estaciones
class StationSearchModal extends StatefulWidget {
  final Function(String? query, String? district, String? availability)
  onSearch;

  const StationSearchModal({super.key, required this.onSearch});

  @override
  State<StationSearchModal> createState() => _StationSearchModalState();
}

class _StationSearchModalState extends State<StationSearchModal> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedDistrict = 'TODOS';
  String _selectedAvailability = 'TODOS';

  // Lista de distritos de Lima
  final List<String> _districts = [
    'TODOS',
    'Miraflores',
    'San Isidro',
    'La Molina',
    'Surco',
    'Lince',
    'San Borja',
    'Jesús María',
    'Pueblo Libre',
    'Magdalena',
    'San Miguel',
  ];

  final List<String> _availabilityOptions = [
    'TODOS',
    'Disponibles',
    'No disponibles',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          const Text(
            'Buscar estación',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppTheme.darkColor,
              fontFamily: 'Inter',
            ),
          ),

          // Campo de búsqueda
          _buildSearchField(),

          // Dropdown Distrito
          _buildDropdown(
            label: 'Distrito',
            value: _selectedDistrict,
            items: _districts,
            onChanged: (value) {
              setState(() {
                _selectedDistrict = value!;
              });
            },
          ),

          // Dropdown Disponibilidad
          _buildDropdown(
            label: 'Disponibilidad',
            value: _selectedAvailability,
            items: _availabilityOptions,
            onChanged: (value) {
              setState(() {
                _selectedAvailability = value!;
              });
            },
          ),

          // Botón Buscar
          SizedBox(
            width: double.infinity,
            child: BlueButton(
              nameButton: 'Buscar',
              onPressed: () {
                widget.onSearch(
                  _searchController.text.isEmpty
                      ? null
                      : _searchController.text,
                  _selectedDistrict,
                  _selectedAvailability,
                );
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Estación',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.darkGrayColor,
            fontWeight: FontWeight.w500,
          ),
        ),        
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Nombre de la estación',
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              letterSpacing: 0,
            ),
            filled: true,
            fillColor: AppTheme.bgColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppTheme.darkGrayColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppTheme.bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.darkGrayColor,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      color: item == 'TODOS'
                          ? Colors.grey[600]
                          : AppTheme.darkColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
