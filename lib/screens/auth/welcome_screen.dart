import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:dosee/components/ui/buttons/app_elevated_button.dart';
import 'package:dosee/components/ui/buttons/app_outlined_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(32),
              Text(
                "Meu app",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                  letterSpacing: 2,
                ),
              ),
              Gap(16),
              Text(
                "Bem-vindo!",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Gap(48),
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  text: "Login",
                ),
              ),
              Gap(16),
              SizedBox(
                width: double.infinity,
                child: AppOutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  text: "Cadastrar-se",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
