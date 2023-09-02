class Player {
  int id = 1;
  String name = '';
  String firstName = '';
  String lastName = '';
  String dateOfBirth = '';
  String nationality = '';
  String section = '';
  dynamic position = '';
  dynamic shirtNumber = '';
  String lastUpdated = '';

  Player(
      {required this.id,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.nationality,
      required this.section,
      required this.position,
      this.shirtNumber,
      required this.lastUpdated});

  Player.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    dateOfBirth = json["dateOfBirth"];
    nationality = json["nationality"];
    section = json["section"];
    position = json["position"];
    shirtNumber = json["shirtNumber"];
    lastUpdated = json["lastUpdated"];
  }

  static List<Player> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Player.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["dateOfBirth"] = dateOfBirth;
    _data["nationality"] = nationality;
    _data["section"] = section;
    _data["position"] = position;
    _data["shirtNumber"] = shirtNumber;
    _data["lastUpdated"] = lastUpdated;
    return _data;
  }
}
