class Venue {
  int? id;
  String? name;
  String? address;
  String? city;
  int? capacity;
  String? surface;
  String? image;

  Venue({this.id, this.name, this.address, this.city, this.capacity, this.surface, this.image});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    city = json["city"];
    capacity = json["capacity"];
    surface = json["surface"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["address"] = address;
    _data["city"] = city;
    _data["capacity"] = capacity;
    _data["surface"] = surface;
    _data["image"] = image;
    return _data;
  }
}