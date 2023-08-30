import 'package:example_app/models/team.dart';

class TableStatistic {
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

  TableStatistic({required this.position, required this.team, required this.playedGames, required this.form, required this.won, required this.draw, required this.lost, required this.points, required this.goalsFor, required this.goalsAgainst, required this.goalDifference});

  TableStatistic.fromJson(Map<String, dynamic> json) {
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

  static List<TableStatistic> fromList(List list) {
    return list.map((map) => TableStatistic.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["position"] = position;
    data["team"] = team.toJson();
    data["playedGames"] = playedGames;
    data["form"] = form;
    data["won"] = won;
    data["draw"] = draw;
    data["lost"] = lost;
    data["points"] = points;
    data["goalsFor"] = goalsFor;
    data["goalsAgainst"] = goalsAgainst;
    data["goalDifference"] = goalDifference;
    return data;
  }
}