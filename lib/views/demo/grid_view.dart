import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GridViewDemoState();
  }
}

class _GridViewDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Center(
            child: Text('Item $index')
          );
        }),
      ),
    );
  }
}
