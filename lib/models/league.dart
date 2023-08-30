class League {
  int? id;
  String? name;
  String? code;
  String? type;
  dynamic emblem;
  String? plan;
  int? numberOfAvailableSeasons;
  String? lastUpdated;

  League({this.id, this.name, this.code, this.type, this.emblem, this.plan, this.numberOfAvailableSeasons, this.lastUpdated});

  League.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    type = json["type"];
    emblem = json["emblem"];
    plan = json["plan"];
    numberOfAvailableSeasons = json["numberOfAvailableSeasons"];
    lastUpdated = json["lastUpdated"];
  }

  static List<League> fromList(List list) {
    return list.map((map) => League.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["code"] = code;
    data["type"] = type;
    data["emblem"] = emblem;
    data["plan"] = plan;
    data["numberOfAvailableSeasons"] = numberOfAvailableSeasons;
    data["lastUpdated"] = lastUpdated;
    return data;
  }
}