// ignore: file_names
import 'package:flutter/material.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo Animation'),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LogoScale(),
            LogoFade(),
          ],
        ),
      ),
    );
  }
}


class LogoScale extends StatefulWidget {
  const LogoScale({super.key});

  @override
  State<LogoScale> createState() => LogoScaleState();
}

class LogoScaleState extends State<LogoScale> {
  double scale = 1.0;

  void _changeScale() {
    setState(() => scale = scale == 1.0 ? 3.0 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _changeScale,
          child: const Text('Scale Logo'),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(seconds: 2),
            child: const FlutterLogo(),
          ),
        ),
      ],
    );
  }
}

class LogoFade extends StatefulWidget {
  const LogoFade({super.key});

  @override
  State<LogoFade> createState() => LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _changeOpacity,
          child: const Text('Fade Logo'),
        ),
         Padding(
          padding: const EdgeInsets.all(50),
          child:AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 3),
            child: const FlutterLogo(),
          ),
        ),
      ],
    );
  }
}

