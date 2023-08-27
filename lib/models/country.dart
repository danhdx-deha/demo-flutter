class Country {
  String? name;
  dynamic code;
  dynamic flag;

  Country({this.name, this.code, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    code = json["code"];
    flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["code"] = code;
    _data["flag"] = flag;
    return _data;
  }
}