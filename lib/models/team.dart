class Team {
  int? id;
  String? name;
  String? code;
  String? country;
  int? founded;
  bool? national;
  String? logo;

  Team(
      {this.id,
      this.name,
      this.code,
      this.country,
      this.founded,
      this.national,
      this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    country = json["country"];
    founded = json["founded"];
    national = json["national"];
    logo = json["logo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["country"] = country;
    _data["founded"] = founded;
    _data["national"] = national;
    _data["logo"] = logo;
    return _data;
  }

  static List<Team> teamsFromApi(List teams) {
    return teams.map((data) {
      return Team.fromJson(data);
    }).toList();
  }
}
