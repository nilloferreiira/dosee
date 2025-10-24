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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medication_rounded),
                  Text(
                    'Dosee',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Text(
                "Seu companheiro no controle das medicações",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
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
