class TeamStatistic {
  String? idStanding;
  String? intRank;
  String? idTeam;
  String? strTeam;
  String? strTeamBadge;
  String? idLeague;
  String? strLeague;
  String? strSeason;
  String? strForm;
  String? strDescription;
  String? intPlayed;
  String? intWin;
  String? intLoss;
  String? intDraw;
  String? intGoalsFor;
  String? intGoalsAgainst;
  String? intGoalDifference;
  String? intPoints;
  String? dateUpdated;

  TeamStatistic({
    this.idStanding,
    this.intRank,
    this.idTeam,
    this.strTeam,
    this.strTeamBadge,
    this.idLeague,
    this.strLeague,
    this.strSeason,
    this.strForm,
    this.strDescription,
    this.intPlayed,
    this.intWin,
    this.intLoss,
    this.intDraw,
    this.intGoalsFor,
    this.intGoalsAgainst,
    this.intGoalDifference,
    this.intPoints,
    this.dateUpdated,
  });

  TeamStatistic.fromJson(dynamic json) {
    idStanding = json['idStanding'];
    intRank = json['intRank'];
    idTeam = json['idTeam'];
    strTeam = json['strTeam'];
    strTeamBadge = json['strTeamBadge'];
    idLeague = json['idLeague'];
    strLeague = json['strLeague'];
    strSeason = json['strSeason'];
    strForm = json['strForm'];
    strDescription = json['strDescription'];
    intPlayed = json['intPlayed'];
    intWin = json['intWin'];
    intLoss = json['intLoss'];
    intDraw = json['intDraw'];
    intGoalsFor = json['intGoalsFor'];
    intGoalsAgainst = json['intGoalsAgainst'];
    intGoalDifference = json['intGoalDifference'];
    intPoints = json['intPoints'];
    dateUpdated = json['dateUpdated'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idStanding'] = idStanding;
    map['intRank'] = intRank;
    map['idTeam'] = idTeam;
    map['strTeam'] = strTeam;
    map['strTeamBadge'] = strTeamBadge;
    map['idLeague'] = idLeague;
    map['strLeague'] = strLeague;
    map['strSeason'] = strSeason;
    map['strForm'] = strForm;
    map['strDescription'] = strDescription;
    map['intPlayed'] = intPlayed;
    map['intWin'] = intWin;
    map['intLoss'] = intLoss;
    map['intDraw'] = intDraw;
    map['intGoalsFor'] = intGoalsFor;
    map['intGoalsAgainst'] = intGoalsAgainst;
    map['intGoalDifference'] = intGoalDifference;
    map['intPoints'] = intPoints;
    map['dateUpdated'] = dateUpdated;
    return map;
  }

  static List<TeamStatistic> fromList(List list) {
    return list.map((map) => TeamStatistic.fromJson(map)).toList();
  }
}
