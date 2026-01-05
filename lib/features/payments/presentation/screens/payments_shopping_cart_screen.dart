import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class PaymentsShoppingCartScreen extends StatefulWidget {
  const PaymentsShoppingCartScreen({super.key});

  @override
  State<PaymentsShoppingCartScreen> createState() =>
      _PaymentsShoppingCartScreenState();
}

class _PaymentsShoppingCartScreenState
    extends State<PaymentsShoppingCartScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namesController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedPaymentMethod = 'card';

  @override
  void dispose() {
    _namesController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get plan data from navigation arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String planName = args?['planName'] ?? 'Plan';
    final String planType = args?['planType'] ?? 'monthly';
    final num price = args?['price'] ?? 0;
    final String displayPeriod = planType == 'monthly' ? '/mes' : '/año';

    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              children: [                
                const HeaderNav(titleText: 'Carrito de Compra'),
                const SizedBox(height: 0),
                // Total Card
                _buildTotalCard(price),

                // Personal Information Section
                const Text(
                  'Información Personal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),

                _buildTextField(
                  controller: _namesController,
                  hintText: 'Nombres',
                ),

                _buildTextField(
                  controller: _addressController,
                  hintText: 'Dirección',
                ),

                _buildTextField(
                  controller: _emailController,
                  hintText: 'Correo',
                  keyboardType: TextInputType.emailAddress,
                ),

                _buildTextField(
                  controller: _phoneController,
                  hintText: 'Teléfono',
                  keyboardType: TextInputType.phone,
                ),

                // Payment Method Section
                const Text(
                  'Método de pago',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),

                _buildPaymentMethods(),

                const SizedBox(height: 5),

                // Proceed Button
                BlueButton(
                  nameButton: 'Realizar pago',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Procesando pago...'),
                        ),
                      );
                    }
                  },
                ),                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalCard(num price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'TOTAL',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: AppTheme.darkColor,
            ),
          ),
          Text(
            'S/ ${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              fontFamily: 'Inter',
              color: AppTheme.darkColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Inter',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es requerido';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Row(
      children: [
        Expanded(
          child: _buildPaymentMethodOption(
            value: 'card',
            icon: Icons.credit_card,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _buildPaymentMethodOption(
            value: 'cash',
            icon: Icons.money,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodOption({
    required String value,
    required IconData icon,
  }) {
    final isSelected = _selectedPaymentMethod == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = value;
        });
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? AppTheme.primaryColor : Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Radio<String>(
              value: value,
              groupValue: _selectedPaymentMethod,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedPaymentMethod = newValue;
                  });
                }
              },
              activeColor: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}