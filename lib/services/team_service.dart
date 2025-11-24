import 'dart:convert';

import 'package:dosee/models/team_member.dart';
import 'package:http/http.dart' as http;

class TeamService {
  static Future<List<TeamMember>> fetchTeam(String url) async {
    try {
      final uri = Uri.parse(url);
      final resp = await http.get(uri).timeout(const Duration(seconds: 10));

      if (resp.statusCode == 200) {
        final data = json.decode(resp.body);

        List<dynamic> list;
        if (data is List) {
          list = data;
        } else {
          list = [];
        }

        return list
            .map<TeamMember>(
              (item) => TeamMember.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  /// Retorna uma lista de exemplo para fallback.
  static List<TeamMember> sampleTeam() => [
    TeamMember(
      name: 'Danillo Ferreira',
      role: 'Criador do aplicativo',
      imageUrl: 'https://github.com/nilloferreiira.png',
    ),
  ];
}
