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
  @override
  Widget build(BuildContext context) {
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
                child: Card(
                  color: const Color(0xff403242),
                  // Define the shape of the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  // Define the child widget of the card
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Club',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'W',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'D',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'L',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Point',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Sarah')),
                          DataCell(Text('19')),
                          DataCell(Text('Student')),
                          DataCell(Text('Student')),
                          DataCell(Text('Student')),
                        ],
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ));
  }
}
