import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  var jsonData;
  Future loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/my-data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    //print(jsonData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Data'),
        ),
        body: Center(
            child: jsonData != null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(jsonData['name']), Text(jsonData['email'])],
            )
                : const CircularProgressIndicator()),
      ),
    );
  }
}