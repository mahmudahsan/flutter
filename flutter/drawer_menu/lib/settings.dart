/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:drawer_menu/drawer_menu.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Font Size: ${getFontSize()}',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline.fontSize),
            ),
          ),
          Slider(
              min: 0.5,
              value: _value,
              onChanged: (newValue) {
                setState(() {
                  _value = newValue;
                });
                print(newValue);
              }),
        ],
      ),
    );
  }

  int getFontSize() => (_value * 30).toInt();
}
