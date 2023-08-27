import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_app/models/league.dart';
import 'package:example_app/services/league_api.dart';
import 'package:example_app/views/team/index.dart';
import 'package:flutter/material.dart';

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
          id: 61,
          name: "Ligue 1",
          type: "League",
          logo: "https://media.api-sports.io/football/leagues/61.png")
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
                                builder: (context) => TeamWidget(
                                      id: leagues[index].id ?? 61,
                                      nameLeague: leagues[index].name ?? '',
                                    )));
                      },
                      leading: CachedNetworkImage(
                        imageUrl: leagues[index].logo ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            leagues[index].name ?? '',
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
