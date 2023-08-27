import 'package:example_app/models/team.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TeamApi {
  static Future<List<Team>> getTeams() async {
    final url = Uri.parse('https://api-football-beta.p.rapidapi.com/teams');
    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '2d022d07c6msh2a644d9a27913cap126b2ejsnc23585f19171',
        'x-rapidapi-host': 'api-football-beta.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List temp = [];
      for (var i in data['response']) {
        temp.add(i['team']);
      }
      return Team.teamsFromApi(temp);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load team');
    }
  }
}