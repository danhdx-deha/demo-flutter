import 'dart:convert';
import 'package:example_app/models/team_statistic.dart';
import 'package:http/http.dart' as http;

class StandingApi {

  static Future<List<TeamStatistic>> fetchStanding(idLeague, season) async {
    List temp = [];
    final url = Uri.parse('https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=$idLeague&s=2023-2024');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      for (var i in data['table']) {
        temp.add(i);
      }
    } else {
      throw Exception('Failed to load standing');
    }
    return TeamStatistic.fromList(temp);
  }
}
