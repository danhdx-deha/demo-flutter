// ignore: file_names
// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Animation'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SlideRightRoute(page: Page3()),
                );
              },
              child: const Text('Next Page Slide Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  FadeRoute(page: Page3()),
                );
              }, 
              child: const Text('Next Page Fade Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  ScaleRoute(page: const Page3()),
                );
              },
              child: const Text('Next Page Scale Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  RotateRoute(page: const Page3()),
                );
              },
              child: const Text('Next Page Rotate Animation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  FlipPageRoute(page: const Page3()),
                );
              },
              child: const Text('Next Page Flip Animation22222222'),
            ),
          ],
        ),
      ),
    );
  }
}


class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 3'),
      ),
    );
  }
}

//Class slide animation
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

//Class fade animation
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  final double opacity;
  FadeRoute({required this.page, this.opacity = 1})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: opacity).animate(animation),
                  child: child,
              ),
        );
}

//Class scale animation
class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: child,
              ),
        );
}

//Class rotate animation
class RotateRoute extends PageRouteBuilder {
  final Widget page;

  RotateRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              RotationTransition(
                turns: Tween<double>(
                  begin: 0.0,
                  end: -1.0,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                )),
                child: child,
              ),
        );
}

//Class flip animation
class FlipPageRoute extends PageRouteBuilder {
  final Widget page;

  FlipPageRoute({required this.page})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                RotationTransition(
                  turns: Tween<double>(
                    begin: 1.0,
                    end: 0.0,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  )),
                  child: child,
                  alignment: Alignment.center,
                ));
}

