import 'dart:convert';

import 'package:example_app/models/match.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MatchApi {
  static Future<List<Matches>> fetchMatch(status) async {
    final now = DateTime.now();
    String stringNow = DateFormat('yyyy-MM-dd').format(now);
    String stringNowAdd10 = DateFormat('yyyy-MM-dd').format(now.add(const Duration(days: 10)));
    // String stringNow = '2023-09-15';
    // String stringNowAdd10 = '2023-09-25';
    List temp = [];
    final url = Uri.parse(
        '${dotenv.env['URL_API']!}/v4/matches/?dateFrom=$stringNow&&dateTo=$stringNowAdd10${status !=
                ''
            ? '&status=$status'
            : ''}');
    final response = await http.get(
      url,
      headers: {
        'X-Auth-Token': '62a2d2d4ba2f4d92b0c20495f807fb82',
      },
    );

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      for (var i in data['matches']) {
        temp.add(i);
      }
      return Matches.fromList(temp);
    } else {
      throw Exception('Failed to load standing');
    }
  }
}
