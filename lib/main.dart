// ignore_for_file: library_private_types_in_public_api


import 'package:example_app/views/FadeWidget.dart';
import 'package:example_app/views/animation.dart';
import 'package:example_app/views/container.dart';
import 'package:example_app/views/logo-animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Giải đấu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Demo(),
        );
      case 1:
        return Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const FootballTournament()
        );
      case 2:
        return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const NewPage(),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onDestinationSelected,
        currentIndex: _currentPageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode_outlined),
            label: 'Demo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: 'Giải đấu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_rounded),
            activeIcon: Icon(Icons.feed),
            label: 'Tin tức',
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryVariant,
        title: Text(widget.title),
      ),
      body: _buildPage(_currentPageIndex),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AnimationDemo()),
                  );
                },
                child: const Text('Next Page Animation'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogoAnimation()),
                  );
                },
                child: const Text('Next Page Logo Animation'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContainerDemo()),
                  );
                },
                child: const Text('Next Page Container'),
              ),
              ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FadeWidget()));
              },
              child: const Text('Next Page Fade Widget')),
            ],
          ),
      ),
    );
  }
}

class FootballTournament extends StatelessWidget {
  const FootballTournament({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0,
                  top:16.0,
                  right:16.0,
                  bottom: 0.0
                ),
              child: Card(
                child: ListTile(
                  leading: Image.asset('assets/1.png'),
                  title: const Text('Item 1'),
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0,
                  top:16.0,
                  right:16.0,
                  bottom: 0.0
                ),
              child: Card(
                child: ListTile(
                  leading: Image.asset('assets/2.png'),
                  title: const Text('Item 2r'),
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0,
                  top:16.0,
                  right:16.0,
                  bottom: 0.0
                ),
              child: Card(
                borderOnForeground: true,
                child: ListTile(
                  leading: Image.asset('assets/3.png'),
                  title: const Text('Item 3'),
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('NewPage'),
      ),
    );
  }
}