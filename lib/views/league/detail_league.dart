import 'package:example_app/models/league.dart';
import 'package:example_app/models/scorer.dart';
import 'package:example_app/services/standing.dart';
import 'package:example_app/views/player/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/team_statistic.dart';
import '../../services/scorer_api.dart';
import 'package:sentry/sentry.dart';

@immutable
class DetailLeagueWidget extends StatefulWidget {
  final int? id;
  final String? codeLeague;
  final League league;

  const DetailLeagueWidget({
    Key? key,
    required this.id,
    required this.league,
    required this.codeLeague,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailLeagueWidgetState();
}

class _DetailLeagueWidgetState extends State<DetailLeagueWidget> {
  late List<TableStatistic> teamStatistics = [];
  late List<Scorer> scorers = [];
  bool _isLoading = true;
  bool _isLoadingPlayer = true;
  bool isSeeAll = false;

  @override
  void initState() {
    super.initState();
    fetchTeamStatistic();
    fetchScorer();
  }

  Future<void> fetchTeamStatistic() async {
    teamStatistics =
        await StandingApi.fetchStanding(widget.id, widget.codeLeague);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> fetchScorer() async {
    scorers = await ScorerApi.fetchScorer(widget.codeLeague);
    setState(() {
      _isLoadingPlayer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(widget.league.name),
          automaticallyImplyLeading: false,
          centerTitle: true,
          forceMaterialTransparency: true,
          titleTextStyle: const TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff403242),
                Color(0xff54444d),
                Color(0xff354257),
                Color(0xff4b4142),
              ],
              // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 12,
              ),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _blockTable(),
              const SizedBox(
                height: 20,
              ),
              _isLoadingPlayer
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _blockGoalScore(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }

  Widget _blockGoalScore() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(34, 34, 59, 100),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Goals Scored',
                style: Style().textContentBlock,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '',
                  style: TextStyle(color: Color.fromRGBO(210, 181, 255, 100)),
                ),
              )
            ],
          ),
          DataTable(
              horizontalMargin: 0,
              columns: <DataColumn>[
                DataColumn(
                    label: Container(
                  width: width * .6,
                  margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: const Text(
                    'Player',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
                const DataColumn(
                    label: SizedBox(
                  child: Text(
                    'Goals',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
              ],
              rows: scorers
                  .take(10)
                  .map((e) => DataRow(cells: [
                        DataCell(TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PlayerWidget(scorer: e)));
                          },
                          child: Text(
                            e.player.name,
                            style: const TextStyle(color: Colors.white),
                            softWrap: true,
                            maxLines: 1,
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            e.goals.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )),
                      ]))
                  .toList())
        ],
      ),
    );
  }

  Widget _blockTable() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff403242),
              Color(0xff54444d),
              Color(0xff354257),
              Color(0xff4b4142),
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Table standings',
                  style: Style().textContentBlock,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isSeeAll = !isSeeAll;
                    });
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Color.fromRGBO(210, 181, 255, 100)),
                  ),
                )
              ],
            ),
            DataTable(
              columnSpacing: 0,
              horizontalMargin: 0,
              columns: _columns(),
              rows: _rows(),
            )
          ],
        ));
  }

  List<DataRow> _rows() {
    List<TableStatistic>? teamStatisticCheck = [];
    if (isSeeAll) {
      teamStatisticCheck = teamStatistics;
    } else {
      teamStatisticCheck = teamStatistics.take(4).toList();
    }
    return teamStatisticCheck
        .map((e) => DataRow(cells: [
              DataCell(Center(
                child: Text(e.position.toString(), style: Style().text),
              )),
              DataCell(Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: e.team.crest.contains('svg')
                          ? SvgPicture.network(
                              e.team.crest,
                              width: 15,
                            )
                          : Image.network(
                              e.team.crest,
                              width: 15,
                            ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 70,
                      child: Text(
                        e.team.name,
                        style: Style().text,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    )
                  ],
                ),
              )),
              DataCell(Text(e.won.toString(), style: Style().text)),
              DataCell(Text(e.draw.toString(), style: Style().text)),
              DataCell(Text(e.lost.toString(), style: Style().text)),
              DataCell(Center(
                child: Text(
                    (e.goalDifference.toString()).contains('-')
                        ? (e.goalDifference.toString())
                        : '+${e.goalDifference}',
                    style: Style().text),
              )),
              DataCell(Center(
                child: Text(e.points.toString(), style: Style().text),
              )),
            ]))
        .toList();
  }

  // Column table
  List<DataColumn> _columns() {
    final double width = MediaQuery.of(context).size.width;
    return <DataColumn>[
      DataColumn(
          label: SizedBox(
              width: width * .04,
              child: Center(
                child: Text(
                  '#',
                  style: Style().textLabel,
                ),
              ))),
      DataColumn(
          label: Container(
        width: width * .4,
        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Text(
          'Club',
          style: Style().textLabel,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.fade,
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: width * .08,
        child: Text(
          'W',
          style: Style().textLabel,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.fade,
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: width * .08,
        child: Text(
          'D',
          style: Style().textLabel,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: width * .08,
        child: Text(
          'L',
          style: Style().textLabel,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.fade,
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: width * .08,
        child: Center(
          child: Text(
            '+/-',
            style: Style().textLabel,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: width * .08,
        child: Center(
          child: Text(
            'P',
            style: Style().textLabel,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ),
      )),
    ];
  }
}

class Style {
  final textLabel = const TextStyle(
      fontStyle: FontStyle.italic, fontSize: 12, color: Colors.white);
  final textContentBlock = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white);
  final text = const TextStyle(fontSize: 12, color: Colors.white);
}
