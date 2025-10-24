import 'package:dosee/components/logo.dart';
import 'package:dosee/components/ui/buttons/app_elevated_button.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              Text(
                "Dosee é um aplicativo criado para ajudar você a nunca "
                "esquecer seus medicamentos. Cadastre suas medicações, "
                "receba lembretes personalizados e confirme o uso com "
                "uma foto garantindo segurança e rotina em dia.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
              //* Como funciona
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      "Como funciona",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Gap(16),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          "Agende seus horários",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Gap(12),
                    Row(
                      children: [
                        Icon(Icons.photo_camera, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          "Tire uma foto do remédio tomado",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Gap(12),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          "Marque como concluído",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Gap(12),
                    Row(
                      children: [
                        Icon(Icons.bar_chart, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          "Acompanhe seu histórico",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //* Elevetaded button conheça nossa equipe
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/team');
                  },
                  text: "Conheça nossa equipe",
                ),
              ),

              Text(
                "Versão 1.0.0 | © 2025 Dosee",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
