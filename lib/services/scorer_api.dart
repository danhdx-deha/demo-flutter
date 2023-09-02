import 'dart:convert';

import 'package:example_app/models/scorer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ScorerApi {
  static Future<List<Scorer>> fetchScorer(codeLeague) async {
    List temp = [];
    final url = Uri.parse('${'${dotenv.env['URL_API']!}/v4/competitions/'+codeLeague}/scorers');
    final response = await http.get(
      url,
      headers: {
        'X-Auth-Token': '${dotenv.env['TOKEN_API']}',
      }
    );

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      for (var i in data['scorers']) {
        temp.add(i);
      }
    } else {
      throw Exception('Fail to load scorer');
    }

    return Scorer.fromList(temp);
  }
}