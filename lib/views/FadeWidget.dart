import 'package:flutter/material.dart';

class FadeWidget extends StatefulWidget {
  const FadeWidget({super.key});
  @override
  State<FadeWidget> createState() => FadeWidgetContainer();
}

class FadeWidgetContainer extends State<FadeWidget> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade Widget Container')),
      body: Center(
          child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(
                milliseconds: 500,
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Tooltip test',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
