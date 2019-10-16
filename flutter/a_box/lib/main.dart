import 'package:flutter/material.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Another Widget'),
          backgroundColor: Colors.green[800],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('Life'),
                color: Colors.white,
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                height: 100,
              ),
              Container(
                child: Text('Is'),
                color: Colors.white,
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                height: 200,
              ),
              Container(
                child: Text('Cool'),
                color: Colors.white,
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                height: 150,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.teal[200],
      ),
    );
  }
}


