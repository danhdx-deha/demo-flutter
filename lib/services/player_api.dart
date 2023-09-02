import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:string_similarity/string_similarity.dart';

class PlayerApi {
  static Future<Map<String, dynamic>> fetchDetail(
      namePlayer, nameTeam, nameNationality, dateOfBirth) async {
    Map<String, dynamic> playerData = {
      'namePlayer': namePlayer,
      'strSigning': '',
      'strAgent': '',
      'strKit': '',
      'strDescriptionEN': '',
      'strPosition': '',
      'strInstagram': '',
      'strFacebook': '',
      'strHeight': '',
      'strWeight': '',
      'strSide': '',
      'strThumb': '',
      'strCutout': '',
      'strRender': '',
      'strNumber': '',
    };
    final url = Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/3/searchplayers.php?p=$namePlayer');
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      for (var i in data['player']) {
        if (i['dateBorn'] == dateOfBirth &&
            (i['strNationality'].contains(nameNationality) ||
                nameNationality.contains(i['strNationality'])) ||
            (i['strTeam'].contains(nameTeam) ||
                nameTeam.contains(i['strTeam']))) {
          playerData = {
            'strSigning': i['strSigning'],
            'namePlayer': namePlayer,
            'strAgent': i['strAgent'],
            'strKit': i['strKit'],
            'strDescriptionEN': i['strDescriptionEN'],
            'strPosition': i['strPosition'],
            'strInstagram': i['strInstagram'],
            'strFacebook': i['strFacebook'],
            'strHeight': i['strHeight'],
            'strWeight': i['strWeight'],
            'strSide': i['strSide'],
            'strThumb': i['strThumb'],
            'strCutout': i['strCutout'],
            'strRender': i['strRender'],
            'strNumber': i['strNumber'],
          };
        }
      }
    } else {
      throw Exception('Failed to load player');
    }
    print(playerData);
    return playerData;
  }
}
