import 'package:example_app/main.dart';
import 'package:flutter/material.dart';

class PageDrawer extends StatefulWidget {
  const PageDrawer({super.key});

  @override
  State<PageDrawer> createState() => _PageDrawer();
}

class _PageDrawer extends State<PageDrawer> {
  int _indexSelected = 0;
  static const TextStyle _optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.green);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: _optionStyle,
    ),
    Text(
      'Index 1: Home1',
      style: _optionStyle,
    ),
    Text(
      'Index 2: Home2',
      style: _optionStyle,
    ),
    Text(
      'Index 3: Home3',
      style: _optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Drawer'),
      ),
      body: Center(
        child: _widgetOptions[_indexSelected],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _indexSelected == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Home 1'),
              selected: _indexSelected == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Home 2'),
              selected: _indexSelected == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Home 3'),
              selected: _indexSelected == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Back'),
              selected: _indexSelected == 3,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
              },
            )
          ],
        ),
      ),
    );
  }
}
