import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcrossScreenWidget extends StatefulWidget {
  const AcrossScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AcrossScreenWidget();
  }
}

class _AcrossScreenWidget extends State {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Animate a widget across screens'),
          backgroundColor: Colors.transparent,
          automaticallyImplyMiddle: false,
        ),
        child: SafeArea(
            child: GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return const DetailScreen();
            }));
          },
          child: Hero(
            tag: 'test',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          )
        )));
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'test',
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.network(
                  'https://picsum.photos/250?image=9',
                ),
                Image.network(
                  'https://picsum.photos/250?image=9',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
