import 'package:example_app/views/FadeWidget.dart';
import 'package:example_app/views/animation.dart';
import 'package:example_app/views/chat_bubbles.dart';
import 'package:example_app/views/container.dart';
import 'package:example_app/views/download_button.dart';
import 'package:example_app/views/expandable_fab.dart';
import 'package:example_app/views/logo-animation.dart';
import 'package:example_app/views/nest_navigator_flow.dart';
import 'package:example_app/views/orientation.dart';
import 'package:example_app/views/photo_filter_carousel.dart';
import 'package:example_app/views/scrolling_parallax.dart';
import 'package:example_app/views/shimmer_loading.dart';
import 'package:example_app/views/stagered_menu_animation.dart';
import 'package:example_app/views/tab_controller.dart';
import 'package:example_app/views/typing_indicator.dart';
import 'package:example_app/views/validate.dart';
import 'package:flutter/material.dart';
import 'views/PageDrawer.dart';

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
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
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
            child: const FootballTournament());
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
            label: 'Demo2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_rounded),
            activeIcon: Icon(Icons.feed),
            label: 'Demo3',
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
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 1 : 4,
          childAspectRatio: 8,
          children: <Widget>[
            for (final btnNextPage in btnNextPages)
              Container(
                height: 50,
                margin: const EdgeInsets.all(1.0),
                child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => btnNextPage.className),
                    );
                  },
                  child: Text(btnNextPage.text),
                ),
              )
            ],
        );
      }
    );
  }
}
class BtnNextPage {
  const BtnNextPage({
    required this.text,
    required this.className,
  });

  final String text;
  final Widget className;
}
const btnNextPages = [
  BtnNextPage(text: 'Next Page Animation', className: AnimationDemo()),
  BtnNextPage(text: 'Next Page Logo Animation', className: LogoAnimation()),
  BtnNextPage(text: 'Next Page Container', className: ContainerDemo()),
  BtnNextPage(text: 'Next Page Fade Widget', className: FadeWidget()),
  BtnNextPage(text: 'Next Page Drawer', className: PageDrawer()),
  BtnNextPage(text: 'Next Page Orientation', className: OrientationCustom()),
  BtnNextPage(text: 'Next Page Tab', className: TabControllerDemo()),
  BtnNextPage(text: 'Next Page DownLoad Button', className: DownLoadButton()),
  BtnNextPage(text: 'Next Page Nest Navigator Flow', className: NestNavigatorFlow()),
  BtnNextPage(text: 'Next Page Photo Filter Carousel', className: PhotoFilterCarousel()),
  BtnNextPage(text: 'Next Page Scrolling Parallax', className: ScrollingParallax()),
  BtnNextPage(text: 'Next Page Shimmer Loading', className: ExampleUiLoadingAnimation()),
  BtnNextPage(text: 'Next Page Validate', className: ValidatePage()),
  BtnNextPage(text: 'Next Page Gradient Chat Bubbles', className: ChatBubbLess()),
  BtnNextPage(text: 'Next Page Expandable FAB', className: ExampleExpandableFab()),
  BtnNextPage(text: 'Next Page Typing Indicator', className: ExampleIsTyping()),
  BtnNextPage(text: 'Next Page Staggered Animations ', className: ExampleStaggeredAnimations())
];

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
                left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
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
                left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
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
                left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
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
      )),
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
