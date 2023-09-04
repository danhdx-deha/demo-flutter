class Matches {
  Area? area;
  Competition? competition;
  Season? season;
  int? id;
  String? utcDate;
  String? status;
  int? matchday;
  String? stage;
  dynamic group;
  String? lastUpdated;
  HomeTeam homeTeam = HomeTeam(crest: 'https://students.senecacollege.ca/assets/Themes/default/images/album-default.png');
  AwayTeam awayTeam = AwayTeam(crest: 'https://students.senecacollege.ca/assets/Themes/default/images/album-default.png');
  Score score = Score(fullTime: FullTime(home: 0, away: 0), halfTime: HalfTime(home: 0, away: 0));
  Odds? odds;
  List<dynamic>? referees;

  Matches(
      {this.area,
      this.competition,
      this.season,
      this.id,
      this.utcDate,
      this.status,
      this.matchday,
      this.stage,
      this.group,
      this.lastUpdated,
      required this.homeTeam,
      required this.awayTeam,
      required this.score,
      this.odds,
      this.referees});

  Matches.fromJson(Map<String, dynamic> json) {
    area = json["area"] == null ? null : Area.fromJson(json["area"]);
    competition = json["competition"] == null
        ? null
        : Competition.fromJson(json["competition"]);
    season = json["season"] == null ? null : Season.fromJson(json["season"]);
    id = json["id"];
    utcDate = json["utcDate"];
    status = json["status"];
    matchday = json["matchday"];
    stage = json["stage"];
    group = json["group"];
    lastUpdated = json["lastUpdated"];
    homeTeam =
        (json["homeTeam"] == null ? null : HomeTeam.fromJson(json["homeTeam"]))!;
    awayTeam =
        (json["awayTeam"] == null ? null : AwayTeam.fromJson(json["awayTeam"]))!;
    score = (json["score"] == null ? null : Score.fromJson(json["score"]))!;
    odds = json["odds"] == null ? null : Odds.fromJson(json["odds"]);
    referees = json["referees"] ?? [];
  }

  static List<Matches> fromList(List list) {
    return list.map((map) => Matches.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (area != null) {
      _data["area"] = area?.toJson();
    }
    if (competition != null) {
      _data["competition"] = competition?.toJson();
    }
    if (season != null) {
      _data["season"] = season?.toJson();
    }
    _data["id"] = id;
    _data["utcDate"] = utcDate;
    _data["status"] = status;
    _data["matchday"] = matchday;
    _data["stage"] = stage;
    _data["group"] = group;
    _data["lastUpdated"] = lastUpdated;
    if (homeTeam != null) {
      _data["homeTeam"] = homeTeam?.toJson();
    }
    if (awayTeam != null) {
      _data["awayTeam"] = awayTeam?.toJson();
    }
    if (score != null) {
      _data["score"] = score?.toJson();
    }
    if (odds != null) {
      _data["odds"] = odds?.toJson();
    }
    if (referees != null) {
      _data["referees"] = referees;
    }
    return _data;
  }
}

class Odds {
  String? msg;

  Odds({this.msg});

  Odds.fromJson(Map<String, dynamic> json) {
    msg = json["msg"];
  }

  static List<Odds> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Odds.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["msg"] = msg;
    return _data;
  }
}

class Score {
  String? winner;
  String? duration;
  FullTime fullTime = FullTime(home: null, away: null);
  HalfTime halfTime = HalfTime(home: 0, away: 0);

  Score({this.winner, this.duration, required this.fullTime, required this.halfTime});

  Score.fromJson(Map<String, dynamic> json) {
    winner = json["winner"];
    duration = json["duration"];
    fullTime =
        (json["fullTime"] == null ? null : FullTime.fromJson(json["fullTime"]))!;
    halfTime =
        (json["halfTime"] == null ? null : HalfTime.fromJson(json["halfTime"]))!;
  }

  static List<Score> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Score.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["winner"] = winner;
    _data["duration"] = duration;
    if (fullTime != null) {
      _data["fullTime"] = fullTime?.toJson();
    }
    if (halfTime != null) {
      _data["halfTime"] = halfTime?.toJson();
    }
    return _data;
  }

  String getScoreFullTime() {
    return '${fullTime.home == null ? '?' : fullTime.home} - ${fullTime.away == null ? '?' : fullTime.home}';
  }
}

class HalfTime {
  dynamic home;
  dynamic away;

  HalfTime({required this.home, required this.away});

  HalfTime.fromJson(Map<String, dynamic> json) {
    home = json["home"];
    away = json["away"];
  }

  static List<HalfTime> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HalfTime.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["home"] = home;
    _data["away"] = away;
    return _data;
  }
}

class FullTime {
  int? home;
  int? away;

  FullTime({required this.home, required this.away});

  FullTime.fromJson(Map<String, dynamic> json) {
    home = json["home"];
    away = json["away"];
  }

  static List<FullTime> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => FullTime.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["home"] = home;
    _data["away"] = away;
    return _data;
  }
}

class AwayTeam {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String crest = 'https://students.senecacollege.ca/assets/Themes/default/images/album-default.png';

  AwayTeam({this.id, this.name, this.shortName, this.tla, required this.crest});

  AwayTeam.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    shortName = json["shortName"];
    tla = json["tla"];
    crest = json["crest"];
  }

  static List<AwayTeam> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AwayTeam.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["shortName"] = shortName;
    _data["tla"] = tla;
    _data["crest"] = crest;
    return _data;
  }
}

class HomeTeam {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String crest = 'https://students.senecacollege.ca/assets/Themes/default/images/album-default.png';

  HomeTeam({this.id, this.name, this.shortName, this.tla, required this.crest});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    shortName = json["shortName"];
    tla = json["tla"];
    crest = json["crest"];
  }

  static List<HomeTeam> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HomeTeam.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["shortName"] = shortName;
    _data["tla"] = tla;
    _data["crest"] = crest;
    return _data;
  }


}

class Season {
  int? id;
  String? startDate;
  String? endDate;
  int? currentMatchday;
  dynamic winner;

  Season(
      {this.id,
      this.startDate,
      this.endDate,
      this.currentMatchday,
      this.winner});

  Season.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    startDate = json["startDate"];
    endDate = json["endDate"];
    currentMatchday = json["currentMatchday"];
    winner = json["winner"];
  }

  static List<Season> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Season.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["startDate"] = startDate;
    _data["endDate"] = endDate;
    _data["currentMatchday"] = currentMatchday;
    _data["winner"] = winner;
    return _data;
  }
}

class Competition {
  int? id;
  String? name;
  String? code;
  String? type;
  String? emblem;

  Competition({this.id, this.name, this.code, this.type, this.emblem});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    type = json["type"];
    emblem = json["emblem"];
  }

  static List<Competition> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Competition.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["type"] = type;
    _data["emblem"] = emblem;
    return _data;
  }
}

class Area {
  int? id;
  String? name;
  String? code;
  String? flag;

  Area({this.id, this.name, this.code, this.flag});

  Area.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    flag = json["flag"];
  }

  static List<Area> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Area.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["flag"] = flag;
    return _data;
  }
}
