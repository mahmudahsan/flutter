import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snackbar'),
        ),
        body: SnackBarDemo(),
      ),
    );
  }
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Hey, You!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );

          Scaffold.of(context).showSnackBar((snackBar));
        },
        child: Text('Show Snackbar'),
      ),
    );
  }
}
