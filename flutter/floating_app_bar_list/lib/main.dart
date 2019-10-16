import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Floating App Bar';

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(title),
              floating: true,
              flexibleSpace: Container(
                child: Center(
                  child: Text(
                    'Hi, Good Morning',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      title: Text('Item #$index'),
                    ),
                childCount: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
