import 'package:dosee/components/ui/private/title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:dosee/components/ui/buttons/app_elevated_button.dart';
import 'package:dosee/components/ui/inputs/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String login = _loginController.text;
      String password = _passwordController.text;
      if (login.length <= 2 || password.length <= 2) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login e senha devem ter pelo menos 3 digitos."),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.of(context).pushReplacementNamed("/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  spacing: 16,
                  children: [
                    SizedBox(
                      width: 80, // defina o tamanho que preferir
                      height: 80,
                      child: Image.asset("assets/images/pill-3.png"),
                    ),
                    PageTitle("Dosee"),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5, // 50%
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Faça seu login", style: TextStyle(fontSize: 24)),
                      Gap(16),

                      Input(
                        controller: _loginController,
                        hintText: 'Digite seu login',
                        validator: (value) => value == null || value.isEmpty
                            ? 'Por favor, insira seu login'
                            : null,
                      ),
                      Gap(24),
                      Input(
                        controller: _passwordController,
                        hintText: 'Digite sua senha',
                        validator: (value) => value == null || value.isEmpty
                            ? 'Por favor, insira sua senha'
                            : null,
                      ),
                      Gap(48),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: AppElevatedButton(
                          onPressed: _submitForm,
                          text: 'Entrar',
                          padding: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
