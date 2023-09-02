import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_app/models/scorer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import '../../services/player_api.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayerWidget extends StatefulWidget {
  final Scorer scorer;

  const PlayerWidget({super.key, required this.scorer});

  @override
  State<StatefulWidget> createState() {
    return PlayerWidgetState();
  }
}

class PlayerWidgetState extends State<PlayerWidget> {
  late Map<String, dynamic> detail = {};
  bool _isLoading = true;
  final String imageDefault = 'https://docs.flutter.dev/cookbook'
      '/img-files/effects/split-check/Avatar1.jpg';

  @override
  void initState() {
    super.initState();
    fetchPlayer();
  }

  Future<void> fetchPlayer() async {
    detail = await PlayerApi.fetchDetail(widget.scorer.player.name,
        widget.scorer.team.name, widget.scorer.player.nationality, widget.scorer.player.dateOfBirth);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Detail Player'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(34, 34, 59, 100),
      body: _isLoading ? const Center(child: CircularProgressIndicator()) : ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 54,
                      height: 54,
                      child: ClipOval(
                        child: Image.network(
                          detail['strCutout'] == '' ? imageDefault : detail['strCutout'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.scorer.player.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: HexagonText(
                  text: detail['strNumber'] ?? '',
                  decorationColor: Colors.pinkAccent,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Text('Date Of Birth: ', style: Style().labelInfo),
                      Text(widget.scorer.player.dateOfBirth,
                          style: Style().textInfo),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Text('Match played: ', style: Style().labelInfo),
                      Text(widget.scorer.playedMatches.toString(),
                          style: Style().textInfo),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Text('Goals: ', style: Style().labelInfo),
                        Text(widget.scorer.goals.toString(),
                            style: Style().textInfo),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Text('Assists: ', style: Style().labelInfo),
                        Text(
                            widget.scorer.assists != null
                                ? widget.scorer.assists.toString()
                                : '0',
                            style: Style().textInfo),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Text('Height: ', style: Style().labelInfo),
                        Text(detail['strHeight'] ?? '',
                            style: Style().textInfo),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Text('Weight: ', style: Style().labelInfo),
                        Text(detail['strWeight'] ?? '',
                            style: Style().textInfo),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child:
                Text(detail['strDescriptionEN'] ?? '', style: Style().textInfo),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 25,
                height: 25,
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: facebookColor,
                ),
              ),
              SizedBox(
                width: 25,
                height: 25,
                child: Icon(
                  FontAwesomeIcons.instagram,
                  color: yahooColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          detail['strRender'] != '' ? SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(imageUrl: detail['strRender'] == '' ? imageDefault : detail['strRender']),
          ) : const Text(''),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class HexagonText extends StatelessWidget {
  final String text;
  final Color decorationColor;

  const HexagonText({
    super.key,
    required this.text,
    required this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: CustomPaint(
        painter: HexagonPainter(decorationColor),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color decorationColor;

  HexagonPainter(this.decorationColor);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    path.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));
    for (var i = 1; i <= 6; i++) {
      final angle = 2.0 * pi / 6 * i;
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);
      path.lineTo(x, y);
    }

    path.close();

    final paint = Paint()..color = decorationColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HexagonPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(HexagonPainter oldDelegate) => false;
}

class Style {
  TextStyle labelInfo = const TextStyle(color: Colors.white38, fontSize: 14);
  TextStyle textInfo = const TextStyle(color: Colors.white, fontSize: 14);
}
