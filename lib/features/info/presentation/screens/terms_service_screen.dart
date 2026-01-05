import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class TermsServiceScreen extends StatelessWidget {
  const TermsServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          children: [
            Column(
              spacing: 35,
              children: [
                const HeaderNav(titleText: 'Términos y condiciones'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const Text(
                      'ÚLTIMA ACTUALIZACIÓN: 2025',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      '''Bienvenido a ZUAP aplicación. Al utilizar este servicio, usted acepta que los siguientes términso y condiciones. Todo el contenido de este documento es ficticio y se utiliza únicamente con fines de demostración''',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const Text(
                      '1. Aceptación de los términos',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Lorem rer asdff ete erekjrerer er egfer asd ase ale ot hnhit mbvyurfmqwpe nr gpwen qw btui hep mwpe nr prmg0iwefw kbrt0 mperng werngo oeignfwepko gwen0 fomeori nogemr oeqp mr',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const Text(
                      '2. Uso de servicio',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Lorem rer asdff ete erekjrerer er egfer asd ase ale ot hnhit mbvyurfmqwpe nr gpwen qw btui hep mwpe nr prmg0iwefw kbrt0 mperng werngo oeignfwepko gwen0 fomeori nogemr oeqp mr',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const Text(
                      '3. Registro y cuenta de usuario',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Lorem rer asdff ete erekjrerer er egfer asd ase ale ot hnhit mbvyurfmqwpe nr gpwen qw btui hep mwpe nr prmg0iwefw kbrt0 mperng werngo oeignfwepko gwen0 fomeori nogemr oeqp mr',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const Text(
                      '4. Privacidad y protección de datos',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Lorem rer asdff ete erekjrerer er egfer asd ase ale ot hnhit mbvyurfmqwpe nr gpwen qw btui hep mwpe nr prmg0iwefw kbrt0 mperng werngo oeignfwepko gwen0 fomeori nogemr oeqp mr',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const Text(
                      '5. Pagos y suscripciones',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Lorem rer asdff ete erekjrerer er egfer asd ase ale ot hnhit mbvyurfmqwpe nr gpwen qw btui hep mwpe nr prmg0iwefw kbrt0 mperng werngo oeignfwepko gwen0 fomeori nogemr oeqp mr',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
