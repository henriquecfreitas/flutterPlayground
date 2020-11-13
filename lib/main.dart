import 'package:flutter/material.dart';
import 'package:flutterPlayground/components/side_nav.dart';
import 'package:flutterPlayground/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spaces',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: const Text('Title'),
        ),
        drawer: SideNav(),
        body: Home(),
      ),
    );
  }
}
