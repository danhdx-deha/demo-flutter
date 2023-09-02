import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_app/models/league.dart';
import 'package:example_app/services/league_api.dart';
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
    leagues = await LeagueApi.fetchLeague();
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
                                      id: leagues[index].id,
                                      league: leagues[index],
                                      codeLeague: leagues[index].code,
                                    )));
                      },
                      leading: leagues[index].emblem.contains('svg')
                          ? Image.asset('assets/logo-default.png')
                          : CachedNetworkImage(
                              imageUrl: leagues[index].emblem,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              leagues[index].name ?? '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ),
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
