import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQLite Demo'),
        ),
        body: Center(
          child: Text('Hello SQLite'),
        ),
      ),
    );
  }
}

class Person {
  final int id;
  final String name;
  final int age;

  Person({this.id, this.name, this.age});
}
