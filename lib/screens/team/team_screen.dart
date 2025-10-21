import 'package:flutter/material.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarPage(title: "Equipe", children: Text("receba da silva")),
    );
  }
}
