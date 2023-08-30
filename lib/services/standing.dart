import 'dart:convert';
import 'package:example_app/models/team_statistic.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StandingApi {
  static Future<List<Table>> fetchStanding(idLeague, season) async {
    List temp = [];
    final url = Uri.parse('${dotenv.env['URL_API']!}/v4/competitions/PL/standings?season=2023');
    final response = await http.get(
      url,
      headers: {
        'X-Auth-Token': '62a2d2d4ba2f4d92b0c20495f807fb82',
      },
    );

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      for (var i in data['standings'][0]) {
        temp.add(i);
      }
    } else {
      throw Exception('Failed to load standing');
    }
    return Table.fromList(temp);
  }
}
