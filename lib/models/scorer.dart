import 'package:example_app/models/player.dart';
import 'package:example_app/models/team.dart';

class Scorer {
  Player player = Player(
      id: 1,
      name: 'name',
      firstName: 'firstName',
      lastName: 'lastName',
      dateOfBirth: 'dateOfBirth',
      nationality: 'nationality',
      section: 'section',
      position: 'position',
      lastUpdated: 'lastUpdated');
  Team team = Team(id: 1, name: 'name', shortName: 'shortName', tla: 'tla', crest: '');
  int playedMatches = 1;
  int goals = 1;
  dynamic assists = '';
  dynamic penalties = '';

  Scorer(
      {required this.player,
      required this.team,
      required this.playedMatches,
      required this.goals,
      this.assists,
      this.penalties});

  Scorer.fromJson(Map<String, dynamic> json) {
    player = (json["player"] == null ? null : Player.fromJson(json["player"]))!;
    team = (json["team"] == null ? null : Team.fromJson(json["team"]))!;
    playedMatches = json["playedMatches"];
    goals = json["goals"];
    assists = json["assists"];
    penalties = json["penalties"];
  }

  static List<Scorer> fromList(List list) {
    return list.map((map) => Scorer.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["player"] = player.toJson();
    _data["team"] = team.toJson();
    _data["playedMatches"] = playedMatches;
    _data["goals"] = goals;
    _data["assists"] = assists;
    _data["penalties"] = penalties;
    return _data;
  }
}
