import 'package:flutter/material.dart';

class DifferentTypeOfItem extends StatefulWidget {
  const DifferentTypeOfItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DifferentTypeOfItemState();
  }
}

class _DifferentTypeOfItemState extends State<DifferentTypeOfItem> {
  final items = List<ListItem>.generate(
      24,
      (index) => index % 6 == 0
          ? HeadingItem('Heading $index')
          : MessageItem('Sender $index', 'Body $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Different Types Of Items'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubTitle(context),
            );
          }),
    );
  }
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(sender);
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(body);
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}
