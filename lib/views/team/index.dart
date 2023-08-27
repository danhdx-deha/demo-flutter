import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/team.dart';

@immutable
class TeamWidget extends StatefulWidget {
  final int id;
  final String nameLeague;


  const TeamWidget({
    super.key,
    required this.id,
    required this.nameLeague,
  });

  @override
  State<StatefulWidget> createState() {
    return _TeamWidgetState();
  }
}

class _TeamWidgetState extends State<TeamWidget> {
  late List<Team> teams;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teams = [
      Team(
          id: 79,
          name: "Lille",
          code: "LIL",
          country: "France",
          founded: 1944,
          national: false,
          logo: "https://media-2.api-sports.io/football/teams/79.png"
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail 1'),
      ),
      body: Text('ttt'),
    );
  }
}
