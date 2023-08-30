import 'dart:convert';
import 'package:example_app/models/league.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LeagueApi {
  static Future<List<League>> fetchLeague() async {
    List temp = [];
    final url = Uri.parse('${dotenv.env['URL_API']!}/v4/competitions');
    final response = await http.get(
      url,
      headers: {
        'X-Auth-Token': '62a2d2d4ba2f4d92b0c20495f807fb82',
      },
    );

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      for (var i in data['competitions']) {
        temp.add(i);
      }
    } else {
      throw Exception('Failed to load league');
    }
    return League.fromList(temp);
  }
}
