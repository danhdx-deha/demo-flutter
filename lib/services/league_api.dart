import 'dart:convert';
import 'package:example_app/models/league.dart';
import 'package:http/http.dart' as http;

class LeagueApi {
  static Future<List<League>> fetchLeague() async {
    final url = Uri.parse('https://api-football-beta.p.rapidapi.com/leagues');
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
        temp.add(i['league']);
      }
      return League.leaguesFromSnapshot(temp);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load league');
    }
  }
}
