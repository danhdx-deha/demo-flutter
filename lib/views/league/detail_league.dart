import 'package:example_app/models/team_statistic.dart';
import 'package:example_app/services/standing.dart';
import 'package:flutter/material.dart';

@immutable
class DetailLeagueWidget extends StatefulWidget {
  final String? id;
  final String? nameLeague;

  const DetailLeagueWidget({
    Key? key,
    required this.id,
    required this.nameLeague,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailLeagueWidgetState();
}

class _DetailLeagueWidgetState extends State<DetailLeagueWidget> {
  late List<TeamStatistic> teamStatistics = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTeamStatistic();
  }

  Future<void> fetchTeamStatistic() async {
    teamStatistics = await StandingApi.fetchStanding(widget.id, widget.nameLeague);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(widget.nameLeague ?? '',
                  style: const TextStyle(fontSize: 20.0))),
          automaticallyImplyLeading: false,
        ),
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
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 12,
              ),
              const Center(
                child: Text(
                  'Standings',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  width: width,
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: DataTable(
                    columnSpacing: 0,
                    horizontalMargin: 0,
                    columns: <DataColumn>[
                      DataColumn(
                          label: SizedBox(
                              width: width * .05,
                              child: Center(
                                child: Text(
                                  'Pos',
                                  style: Style().textLabel,
                                ),
                              ))),
                      DataColumn(
                          label: Container(
                        width: width * .35,
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
                        width: width * .1,
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
                        width: width * .1,
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
                        width: width * .1,
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
                        width: width * .1,
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
                        width: width * .1,
                        child: Center(
                          child: Text(
                            'Point',
                            style: Style().textLabel,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      )),
                    ],
                    rows: teamStatistics
                        .map((e) => DataRow(cells: [
                              DataCell(Center(
                                child:
                                    Text(e.intRank ?? '', style: Style().text),
                              )),
                              DataCell(Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      e.strTeamBadge ?? '',
                                      width: 15,
                                    ),
                                    const SizedBox(width: 15),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        e.strTeam ?? '',
                                        style: Style().text,
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              DataCell(
                                  Text(e.intWin ?? '', style: Style().text)),
                              DataCell(
                                  Text(e.intDraw ?? '', style: Style().text)),
                              DataCell(
                                  Text(e.intLoss ?? '', style: Style().text)),
                              DataCell(Center(
                                child: Text(
                                    (e.intGoalDifference ?? '').contains('-')
                                        ? (e.intGoalDifference ?? '')
                                        : '+${e.intGoalDifference ?? ''}',
                                    style: Style().text),
                              )),
                              DataCell(Center(
                                child: Text(e.intPoints ?? '',
                                    style: Style().text),
                              )),
                            ]))
                        .toList(),
                  )),
            ],
          ),
        ));
  }
}

class Style {
  final textLabel = const TextStyle(
      fontStyle: FontStyle.italic, fontSize: 12, color: Colors.white);
  final text = const TextStyle(fontSize: 12, color: Colors.white);
}
