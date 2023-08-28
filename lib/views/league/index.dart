import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_app/models/league.dart';
import 'package:example_app/services/league_api.dart';
import 'package:example_app/views/team/index.dart';
import 'package:flutter/material.dart';

import 'detail_league.dart';

class FootballTournament extends StatefulWidget {
  const FootballTournament({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FootballTournament();
  }
}

class _FootballTournament extends State<FootballTournament> {
  late List<League> leagues;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchLeague();
  }

  Future<void> fetchLeague() async {
    // leagues = await LeagueApi.fetchLeague();
    leagues = [
      League(
          idLeague: "4328",
          strSport: "Soccer",
          strLeague: "English Premier League",
          strCurrentSeason: "2023-2024",
          intFormedYear: "1992",
          dateFirstEvent: "1992-08-15",
          strGender: "Male",
          strCountry: "England",
          strDescriptionEN:
              "The Premier League, often referred to as the English Premier League or the EPL (legal name: The Football Association Premier League Limited), is the top level of the English football league system. Contested by 20 clubs, it operates on a system of promotion and relegation with the English Football League (EFL). Seasons run from August to May with each team playing 38 matches (playing all 19 other teams both home and away). Most games are played on Saturday and Sunday afternoons.\r\n\r\nThe competition was founded as the FA Premier League on 20 February 1992 following the decision of clubs in the Football League First Division to break away from the Football League, founded in 1888, and take advantage of a lucrative television rights sale to Sky. From 2019-20, the league's accumulated television rights deals were worth around £3.1 billion a year, with Sky and BT Group securing the domestic rights to broadcast 128 and 32 games respectively. The Premier League is a corporation where chief executive Richard Masters is responsible for its management, whilst the member clubs act as shareholders. Clubs were apportioned central payment revenues of £2.4 billion in 2016–17, with a further £343 million in solidarity payments to English Football League (EFL) clubs.\r\n\r\nThe Premier League is the most-watched sports league in the world, broadcast in 212 territories to 643 million homes and a potential TV audience of 4.7 billion people. For the 2018–19 season, the average Premier League match attendance was at 38,181, second to the German Bundesliga's 43,500, while aggregated attendance across all matches is the highest of any association football league at 14,508,981. Most stadium occupancies are near capacity. The Premier League ranks first in the UEFA coefficients of leagues based on performances in European competitions over the past five seasons as of 2021. The English top-flight has produced the second-highest number of UEFA Champions League/European Cup titles, with five English clubs having won fourteen European trophies in total.\r\n\r\nFifty clubs have competed since the inception of the Premier League in 1992: forty-eight English and two Welsh clubs. Seven of them have won the title: Manchester United (13), Chelsea (5), Manchester City (5), Arsenal (3), Blackburn Rovers (1), Leicester City (1) and Liverpool (1).",
          strFanart1:
              "https://www.thesportsdb.com/images/media/league/fanart/cu17hv1619947926.jpg",
          strFanart2:
              "https://www.thesportsdb.com/images/media/league/fanart/7lse8e1619948016.jpg",
          strFanart3:
              "https://www.thesportsdb.com/images/media/league/fanart/3tjmas1547554302.jpg",
          strFanart4:
              "https://www.thesportsdb.com/images/media/league/fanart/30xym81619948109.jpg",
          strBanner:
              "https://www.thesportsdb.com/images/media/league/banner/xe1es51638921786.jpg",
          strBadge:
              "https://www.thesportsdb.com/images/media/league/badge/dsnjpz1679951317.png",
          strLogo:
              "https://www.thesportsdb.com/images/media/league/logo/4c377s1535214890.png",
          strPoster:
              "https://www.thesportsdb.com/images/media/league/poster/vja2a61632491835.jpg",
          strTrophy:
              "https://www.thesportsdb.com/images/media/league/trophy/9a6kw51689108793.png")
    ];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
              itemCount: leagues.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailLeagueWidget(
                                      id: leagues[index].idLeague ?? '4328',
                                      nameLeague: leagues[index].strLeague ?? '',
                                    )));
                      },
                      leading: CachedNetworkImage(
                        imageUrl: leagues[index].strBadge ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            leagues[index].strLeague ?? '',
                          )
                        ],
                      ),
                      trailing: const Icon(Icons.navigate_next),
                    ),
                  ),
                );
              },
            )),
    );
  }
}
