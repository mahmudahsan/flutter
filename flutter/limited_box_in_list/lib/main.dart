import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Color getRandom() {
    return Color.fromARGB(0xff, Random().nextInt(256), Random().nextInt(256),
        Random().nextInt(256));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LimitedBox in List'),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              for (int i = 0; i < 100; ++i)
                LimitedBox(
                  maxHeight: 200,
                  child: Container(
                    color: getRandom(),
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
