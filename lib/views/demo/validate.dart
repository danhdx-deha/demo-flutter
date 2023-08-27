import 'package:flutter/material.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ValidatePageState();
  }
}

class _ValidatePageState extends State {
  final _formKey = GlobalKey<FormState>();
  String _textInput = '';
  late FocusNode myFocusNode = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_printCustom);
  }

  void _printCustom() {
    final text = controller.text;
    setState(() {
      _textInput = 'input 3: $text';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chapter 4')),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(_textInput),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const TextField(
                        autofocus: true,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: const InputDecoration(),
                        focusNode: myFocusNode,
                        maxLength: 10,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Submit')),
                    InkWell(
                      // When the user taps the button, show a snackbar.
                      onTap: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Tap'),
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('Flat Button'),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        myFocusNode.requestFocus();
      }),
    );
  }
}
