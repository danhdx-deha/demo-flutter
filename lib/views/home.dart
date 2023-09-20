import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:example_app/models/match.dart';
import 'package:example_app/services/match_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _isActive = 1;
  bool _isLoading = true;
  late List<Matches> matches = [];
  late List<Matches> matchesScheduled = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMatch();
  }

  Future<void> fetchMatch() async {
    matches = await MatchApi.fetchMatch('');
    matchesScheduled = await MatchApi.fetchMatch('SCHEDULED');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff181928),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    _sliderMatch(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Match Schedule',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text('See All',
                                style: TextStyle(fontSize: 16)))
                      ],
                    ),
                    for (int index = 0;
                        index < matchesScheduled.take(3).length;
                        index++)
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10)),
                            color: Color(0xff222232)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 5,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              matchesScheduled[index].homeTeam.shortName ?? '',
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            matchesScheduled[index]
                                    .homeTeam
                                    .crest
                                    .contains('svg')
                                ? SvgPicture.network(
                                    matchesScheduled[index].homeTeam.crest,
                                    width: 40,
                                  )
                                : Image.network(
                                    matchesScheduled[index].homeTeam.crest,
                                    width: 40,
                                  ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('MMM d yyyy').format(DateTime.parse(matchesScheduled[index].utcDate ?? '')),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Text(
                                    DateFormat('HH:mm').format(DateTime.parse(matchesScheduled[index].utcDate ?? '')),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            matchesScheduled[index]
                                    .awayTeam
                                    .crest
                                    .contains('svg')
                                ? SvgPicture.network(
                                    matchesScheduled[index].awayTeam.crest,
                                    width: 40,
                                  )
                                : Image.network(
                                    matchesScheduled[index].awayTeam.crest,
                                    width: 40,
                                  ),
                            Text(
                              matchesScheduled[index].awayTeam.shortName ?? '',
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
        ));
  }

  Widget _sliderMatch() {
    const style = TextStyle(color: Colors.white, fontSize: 11);
    final double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
        height: width * 0.7 * 14 / 25,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: matches.length < 2 ? false : true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 3000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        onPageChanged: (index, reason) {
          setState(() {
            _isActive = index;
          });
        },
      ),
      items: matches.map((e) {
        return Builder(
          builder: (BuildContext context) {
            final double width = MediaQuery.of(context).size.width * 0.7;
            return Container(
              margin: const EdgeInsets.all(10),
              color: const Color(0xff181928),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(1, 0.5),
                      colors: <Color>[
                        Color(0xff4568dc),
                        Color(0xff5d68d3),
                        Color(0xff7b69c7),
                        Color(0xff966abd),
                        Color(0xffb06ab3),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(18, 18))),
                height: width * 10 / 25,
                width: width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: width,
                      child: Text(
                        e.status ?? '',
                        style: style,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child: CircleAvatar(
                              child: e.homeTeam.crest.contains('svg')
                                  ? SvgPicture.network(
                                      e.homeTeam.crest,
                                      width: 40,
                                    )
                                  : Image.network(
                                      e.homeTeam.crest,
                                      width: 40,
                                    ),
                            ),
                          ),
                          Text(
                            e.score.getScoreFullTime(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: width * 0.4,
                            child: CircleAvatar(
                              child: e.awayTeam.crest.contains('svg')
                                  ? SvgPicture.network(
                                      e.awayTeam.crest,
                                      width: 40,
                                    )
                                  : Image.network(
                                      e.awayTeam.crest,
                                      width: 40,
                                    ),
                            ),
                          ),
                        ]),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       padding: const EdgeInsets.only(left: 10),
                    //       width: width * 0.4,
                    //       child: const Column(
                    //         mainAxisSize: MainAxisSize.max,
                    //         children: [
                    //           SizedBox(
                    //             width: double.infinity,
                    //             child: Text(
                    //               "De Jong 66'",
                    //               overflow: TextOverflow.fade,
                    //               maxLines: 1,
                    //               softWrap: false,
                    //               style: style,
                    //               textAlign: TextAlign.left,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: double.infinity,
                    //             child: Text(
                    //               "Depay 79'",
                    //               overflow: TextOverflow.fade,
                    //               maxLines: 1,
                    //               softWrap: false,
                    //               style: style,
                    //               textAlign: TextAlign.left,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       padding: const EdgeInsets.only(left: 10),
                    //       width: width * 0.4,
                    //       child: const Column(
                    //         children: [
                    //           SizedBox(
                    //             width: double.infinity,
                    //             child: Text(
                    //               "De Jong 66'",
                    //               style: style,
                    //               overflow: TextOverflow.fade,
                    //               maxLines: 1,
                    //               softWrap: false,
                    //               textAlign: TextAlign.left,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: double.infinity,
                    //             child: Text(
                    //               "Depay 79'",
                    //               style: style,
                    //               overflow: TextOverflow.fade,
                    //               maxLines: 1,
                    //               softWrap: false,
                    //               textAlign: TextAlign.left,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
