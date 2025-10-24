import 'package:dosee/components/logo.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'Sobre o dosee',
      children: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 32,
            children: [
              DoseeLogo(),
              Text(
                "Seu companheiro no controle das medicações",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              //* Texto sobre o app
              //* Como funciona
              // Elevetaded button conheça nossa equipe
            ],
          ),
        ),
      ),
    );

    // TextButton(
    //             onPressed: () {
    //               Navigator.pushNamed(context, '/team');
    //             },
    //             child: Text('equipe'),
    //           )
  }
}
