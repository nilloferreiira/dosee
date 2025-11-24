import 'package:dosee/components/ui/private/title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:dosee/components/ui/buttons/app_elevated_button.dart';
import 'package:dosee/components/ui/inputs/input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String login = _loginController.text.trim();
      String password = _passwordController.text;
      String confirm = _confirmPasswordController.text;

      if (name.length <= 2 || login.length <= 2 || password.length <= 2) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Nome, login e senha devem ter pelo menos 3 dígitos.",
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (password != confirm) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("As senhas não coincidem."),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Aqui normalmente faria a chamada ao backend para criar a conta.
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
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/images/pill-3.png"),
                    ),
                    PageTitle("Dosee"),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      // garante que a coluna ocupe ao menos uma fração da tela,
                      // mas permite rolagem se o teclado reduzir o espaço disponível
                      minHeight: MediaQuery.of(context).size.height * 0.55,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Crie sua conta",
                            style: TextStyle(fontSize: 24),
                          ),
                          Gap(16),

                          Input(
                            controller: _nameController,
                            hintText: 'Digite seu nome',
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor, insira seu nome'
                                : null,
                          ),
                          Gap(16),

                          Input(
                            controller: _loginController,
                            hintText: 'Escolha um login',
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor, insira um login'
                                : null,
                          ),
                          Gap(24),

                          Input(
                            controller: _passwordController,
                            hintText: 'Digite sua senha',
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor, insira uma senha'
                                : null,
                          ),
                          Gap(16),

                          Input(
                            controller: _confirmPasswordController,
                            hintText: 'Confirme sua senha',
                            validator: (value) => value == null || value.isEmpty
                                ? 'Por favor, confirme sua senha'
                                : null,
                          ),
                          Gap(48),

                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: AppElevatedButton(
                              onPressed: _submitForm,
                              text: 'Registrar',
                              padding: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
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
