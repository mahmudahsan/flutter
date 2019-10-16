/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:states_redux/drawer_menu.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double _value = 0.5;
  bool isBold = false;
  bool isItalic = false;

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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: isBold,
                  onChanged: (newVal) {
                    setState(() {
                      isBold = newVal;
                    });
                  },
                ),
                Text(
                  'Bold',
                  style: getStyle(isBold, false),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: isItalic,
                    onChanged: (newVal) {
                      setState(() {
                        isItalic = newVal;
                      });
                    }),
                Text(
                  'Italic',
                  style: getStyle(false, isItalic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int getFontSize() => (_value * 30).toInt();

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
