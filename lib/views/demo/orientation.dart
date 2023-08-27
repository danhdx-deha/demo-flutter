import 'package:flutter/material.dart';

class OrientationCustom extends StatefulWidget {
  const OrientationCustom ({super.key});
  
  @override
  State<StatefulWidget> createState() => _OrientationState();
}

class _OrientationState extends State<OrientationCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orientation')),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
              ),
            );
          }),
        );
      })
    );
  }

}