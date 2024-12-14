import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  static String route = 'test_view';

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  var jsonData;

  Future<void> loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/users.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
        ),
        body: Center(
          child: jsonData != null
              ? Column(
                  children: [
                    Text(jsonData['username']),
                    Text(jsonData['email']),
                  ],
                )
              : const CircularProgressIndicator(),
        ));
  }
}
