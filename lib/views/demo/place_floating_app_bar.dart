import 'package:flutter/material.dart';

class PlaceFloatingAppBar extends StatefulWidget {
  const PlaceFloatingAppBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PlaceFloatingAppBarState();
  }
}

class _PlaceFloatingAppBarState extends State<PlaceFloatingAppBar> with TickerProviderStateMixin {

  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Title'),
            floating: true,
            flexibleSpace: FlexibleSpaceBar(),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                        title: Text('Title $index'),
                      ),
                  childCount: 100)),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFadeTransition(
            opacity: animation,
            sliver: SliverFixedExtentList(
              itemExtent: 100.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color:
                        index.isEven ? Colors.indigo[200] : Colors.orange[200],
                  );
                },
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
