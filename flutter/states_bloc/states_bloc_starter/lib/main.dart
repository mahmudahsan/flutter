import 'package:flutter/material.dart';
import 'package:states_bloc/home.dart';
import 'package:states_bloc/about.dart';
import 'package:states_bloc/settings.dart';

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
