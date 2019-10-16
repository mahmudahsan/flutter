import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Data',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Theme Data'),
        ),
        body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(
              headline: TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
          ),
          child: Text(
            'Hello World',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.green),
        ),
        child: FloatingActionButton(
          onPressed: (){
            print('+');
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
