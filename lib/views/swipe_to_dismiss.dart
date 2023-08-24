import 'package:flutter/material.dart';

class SwipeToDissmiss extends StatefulWidget {
  const SwipeToDissmiss({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SwipeToDissmiss();
  }
}

class _SwipeToDissmiss extends State {
  final items = List<String>.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe to dismiss')),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text(item),
              ),
            );
          }),
    );
  }
}
