import 'package:flutter/widgets.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';
import 'package:zuap_mobile_app/shared/widgets/app_scaffold.dart';
import 'package:zuap_mobile_app/shared/widgets/button_blue.dart';
import 'package:zuap_mobile_app/shared/widgets/header_nav.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          children: [
            HeaderNav(titleText: 'Sobre nosotros'),
            SizedBox(height: 35),          
             Container(
                  padding: EdgeInsets.all(0),
                  height: 340,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://i.blogs.es/58eaaa/seat-mo_37_hq/450_1000.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
            SizedBox(height: 35),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. has survived not only five centuries, but also the leap into electronic typesetting',
            style: TextStyle(color: AppTheme.darkGrayColor)),
            SizedBox(height: 15),
            Text(
              'Remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: TextStyle(color: AppTheme.darkGrayColor)),
            SizedBox(height: 30),
            BlueButton(nameButton: 'Términos y condiciones')
          ],
        ),
      ),
    );
  }
}
