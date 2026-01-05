import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';
import 'package:zuap_mobile_app/features/info/presentation/widgets/faq_accordion_item.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            spacing: 40,
            children: [
              const HeaderNav(titleText: 'FAQ'),
              Column(
                children: [
                  FaqAccordionItem(
                    question:
                        '¿Cómo funciona el servicio de intercambio de baterías?',
                    answer:
                        'Nuestro servicio permite intercambiar tu batería descargada por una completamente cargada en nuestras estaciones. Solo necesitas acercarte a una estación, escanear el código QR y realizar el intercambio en segundos.',
                  ),
                  FaqAccordionItem(
                    question: '¿Cuánto tiempo tarda el intercambio de batería?',
                    answer:
                        'El proceso de intercambio toma aproximadamente 30 segundos. Es rápido, seguro y te permite continuar tu viaje sin interrupciones.',
                  ),
                  FaqAccordionItem(
                    question:
                        '¿Dónde puedo encontrar las estaciones de intercambio?',
                    answer:
                        'Puedes encontrar todas nuestras estaciones en el mapa de la aplicación. Están ubicadas estratégicamente en toda la ciudad para tu conveniencia.',
                  ),
                  FaqAccordionItem(
                    question: '¿Qué planes de suscripción están disponibles?',
                    answer:
                        'Ofrecemos varios planes adaptados a tus necesidades: Plan Básico, Plan Urbano (el más popular) y Plan Premium. Cada uno con diferentes cantidades de intercambios mensuales.',
                  ),
                  FaqAccordionItem(
                    question: '¿Cómo vinculo mi motocicleta a la aplicación?',
                    answer:
                        'Para vincular tu motocicleta, ve al menú lateral, selecciona "Vincular moto" y escanea el código QR de tu vehículo. El proceso es rápido y solo necesitas hacerlo una vez.',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 25,
                children: [
                  Column(                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('¿Te quedaste con alguna duda?', style: TextStyle(
                        fontWeight: FontWeight.w900
                      ),),
                      const Text('Comunicate con nuestro equipo de soporte')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(onPressed: () {}, backgroundColor: AppTheme.acentoColor, child: SvgPicture.asset('assets/images/icon_whatsapp.svg', height: 35)),
                      FloatingActionButton(onPressed: () {}, backgroundColor: AppTheme.acentoColor, child: SvgPicture.asset('assets/images/icon_mail.svg', height: 35))
                    ],
                  )
                ],
              )
              // FAQ Items
            ],
          ),
        ),
      ),
    );
  }
}
