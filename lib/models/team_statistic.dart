import 'package:example_app/models/team.dart';

class Table {
  int position = 1;
  Team team = Team(id: 1, name: 'name', shortName: 'shortName', tla: 'tla', crest: 'crest');
  int playedGames = 1;
  String form = '1';
  int won = 1;
  int draw = 1;
  int lost = 1;
  int points = 0;
  int goalsFor = 0;
  int goalsAgainst = 0;
  int goalDifference = 0;

  Table({required this.position, required this.team, required this.playedGames, required this.form, required this.won, required this.draw, required this.lost, required this.points, required this.goalsFor, required this.goalsAgainst, required this.goalDifference});

  Table.fromJson(Map<String, dynamic> json) {
    position = json["position"];
    team = (json["team"] == null ? null : Team.fromJson(json["team"]))!;
    playedGames = json["playedGames"];
    form = json["form"];
    won = json["won"];
    draw = json["draw"];
    lost = json["lost"];
    points = json["points"];
    goalsFor = json["goalsFor"];
    goalsAgainst = json["goalsAgainst"];
    goalDifference = json["goalDifference"];
  }

  static List<Table> fromList(List list) {
    return list.map((map) => Table.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["position"] = position;
    if(team != null) {
      _data["team"] = team.toJson();
    }
    _data["playedGames"] = playedGames;
    _data["form"] = form;
    _data["won"] = won;
    _data["draw"] = draw;
    _data["lost"] = lost;
    _data["points"] = points;
    _data["goalsFor"] = goalsFor;
    _data["goalsAgainst"] = goalsAgainst;
    _data["goalDifference"] = goalDifference;
    return _data;
  }
}