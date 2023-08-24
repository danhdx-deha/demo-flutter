import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ButtonCustom();
  }
}

class _ButtonCustom extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ButtonCustom')),
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('content')));
              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Custom'),
                  ),
                ),
              )),
          FadeInImage.assetNetwork(
            placeholder: 'assets/vu.png',
            image: 'https://picsum.photos/250?image=9',
          ),
          const Text('---------------'),
          // Container(
          //   margin: const EdgeInsets.all(10),
          //   child: CachedNetworkImage(
          //     imageUrl: 'https://picsum.photos/250?image=9',
          //     placeholder: (context, url) => const CircularProgressIndicator(),
          //   ),
          // )
        ],
      ),
    );
  }
}
