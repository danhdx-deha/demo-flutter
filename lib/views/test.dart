import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShaderMask Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ShaderMask Demo'),
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const RadialGradient(
                center: Alignment.center,
                radius: 0.5,
                colors: [Colors.yellow, Colors.transparent],
                stops: [0.5, 1.0],
              ).createShader(const Rect.fromLTWH(
            0, 110,
           200,
            200
          ),);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset('assets/vu.png', width: 200, height: 200, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}