import 'package:flutter/material.dart';
import 'package:drawer_menu/home.dart';
import 'package:drawer_menu/about.dart';
import 'package:drawer_menu/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => About(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
