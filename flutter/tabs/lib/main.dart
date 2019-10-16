import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Demo'),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_boat)),
              Tab(icon: Icon(Icons.directions_transit)),
            ]),
          ),
          body: TabBarView(children: [
            TabA(),
            Icon(Icons.directions_boat),
            Icon(Icons.directions_transit),
          ]),
        ),
      ),
    );
  }
}

class TabA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
