class Team {
  int id = 1;
  String name = '';
  String shortName = '';
  String tla = '';
  String crest = '';

  Team({required this.id, required this.name, required this.shortName, required this.tla, required this.crest});

  Team.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    shortName = json["shortName"];
    tla = json["tla"];
    crest = json["crest"];
  }

  static List<Team> fromList(List list) {
    return list.map((map) => Team.fromJson(map)).toList();
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