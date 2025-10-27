import 'package:dosee/components/ui/card/card_team.dart';
import 'package:flutter/material.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';
import 'package:gap/gap.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: "Equipe",
      children: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              'Conheça nossa equipe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(32),
            CardTeam(
              title: 'Danillo Ferreira',
              description: 'Criador do aplicativo',
              image: 'https://github.com/nilloferreiira.png',
            ),
            CardTeam(
              title: 'Danillo Ferreira',
              description: 'Desenvolvedor do aplicativo',
              image: 'https://github.com/nilloferreiira.png',
            ),
            CardTeam(
              title: 'Danillo Ferreira',
              description: 'Designer do aplicativo',
              image: 'https://github.com/nilloferreiira.png',
            ),
          ],
        ),
      ),
    );
  }
}
