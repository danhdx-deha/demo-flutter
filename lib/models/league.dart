class League {
  String? idLeague;
  String? strSport;
  String? strLeague;
  String? strCurrentSeason;
  String? intFormedYear;
  String? dateFirstEvent;
  String? strGender;
  String? strCountry;
  String? strRss;
  String? strDescriptionEN;
  String? strTvRights;
  String? strFanart1;
  String? strFanart2;
  String? strFanart3;
  String? strFanart4;
  String? strBanner;
  String? strBadge;
  String? strLogo;
  String? strPoster;
  String? strTrophy;

  League({
    this.idLeague,
    this.strSport,
    this.strLeague,
    this.strCurrentSeason,
    this.intFormedYear,
    this.dateFirstEvent,
    this.strGender,
    this.strCountry,
    this.strRss,
    this.strDescriptionEN,
    this.strTvRights,
    this.strFanart1,
    this.strFanart2,
    this.strFanart3,
    this.strFanart4,
    this.strBanner,
    this.strBadge,
    this.strLogo,
    this.strPoster,
    this.strTrophy,
  });

  League.fromJson(Map<String, dynamic> json) {
    idLeague = json["idLeague"];
    strSport = json["strSport"];
    strLeague = json["strLeague"];
    strCurrentSeason = json["strCurrentSeason"];
    intFormedYear = json["intFormedYear"];
    dateFirstEvent = json["dateFirstEvent"];
    strGender = json["strGender"];
    strCountry = json["strCountry"];
    strRss = json["strRSS"];
    strDescriptionEN = json["strDescriptionEN"];
    strTvRights = json["strTvRights"];
    strFanart1 = json["strFanart1"];
    strFanart2 = json["strFanart2"];
    strFanart3 = json["strFanart3"];
    strFanart4 = json["strFanart4"];
    strBanner = json["strBanner"];
    strBadge = json["strBadge"];
    strLogo = json["strLogo"];
    strPoster = json["strPoster"];
    strTrophy = json["strTrophy"];
  }

  static List<League> fromList(List list) {
    return list.map((map) => League.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idLeague"] = idLeague;
    _data["strSport"] = strSport;
    _data["strLeague"] = strLeague;
    _data["strCurrentSeason"] = strCurrentSeason;
    _data["intFormedYear"] = intFormedYear;
    _data["dateFirstEvent"] = dateFirstEvent;
    _data["strGender"] = strGender;
    _data["strCountry"] = strCountry;
    _data["strRSS"] = strRss;
    _data["strDescriptionEN"] = strDescriptionEN;
    _data["strTvRights"] = strTvRights;
    _data["strFanart1"] = strFanart1;
    _data["strFanart2"] = strFanart2;
    _data["strFanart3"] = strFanart3;
    _data["strFanart4"] = strFanart4;
    _data["strBanner"] = strBanner;
    _data["strBadge"] = strBadge;
    _data["strLogo"] = strLogo;
    _data["strPoster"] = strPoster;
    _data["strTrophy"] = strTrophy;
    return _data;
  }
}