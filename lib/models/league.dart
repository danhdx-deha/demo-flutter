class League {
  int? id;
  String? name;
  String? type;
  String? logo;

  League({this.id, this.name, this.type, this.logo});

  League.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    type = json["type"];
    logo = json["logo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["type"] = type;
    _data["logo"] = logo;
    return _data;
  }

  static List<League> leaguesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return League.fromJson(data);
    }).toList();
  }


  @override
  String toString() {
    return 'League{id: $id, name: $name, type: $type, logo: $logo}';
  }
}