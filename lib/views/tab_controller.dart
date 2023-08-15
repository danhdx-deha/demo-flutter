import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class TabControllerDemo extends StatefulWidget {
  const TabControllerDemo({super.key});
  
  @override
  State<StatefulWidget> createState() => _TabControllerDemoState();
}

class _TabControllerDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
              labelColor: Colors.black,
            ),
          ),
          body: TabBarView(
            children: [
              Image.network('https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/10/25/1109025/Toyota-Bz4x.jpeg'),
              GifView.network(
                'https://www.showmetech.com.br/wp-content/uploads/2015/09/happy-minion-gif.gif',
                height: 200,
                width: 200,
              ),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}