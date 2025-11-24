import 'package:dosee/components/ui/card/card_team.dart';
import 'package:flutter/material.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';
import 'package:gap/gap.dart';
import 'package:dosee/models/team_member.dart';
import 'package:dosee/services/team_service.dart';

const String _apiUrl =
    'https://6924c3f582b59600d7214794.mockapi.io/api/team'; // substitua pela sua URL

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: "Equipe",
      children: Center(
        child: FutureBuilder<List<TeamMember>>(
          future: TeamService.fetchTeam(_apiUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Erro ao carregar equipe',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            final members = (snapshot.data == null || snapshot.data!.isEmpty)
                ? TeamService.sampleTeam()
                : snapshot.data!;

            return ListView(
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
                ...members.map(
                  (m) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CardTeam(
                      title: m.name,
                      description: m.role,
                      image: m.imageUrl.isNotEmpty ? m.imageUrl : '',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
