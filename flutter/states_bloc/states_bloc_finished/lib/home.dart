/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:states_bloc/drawer_menu.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:states_bloc/bloc/settings/settings_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const kAppTitle = 'States by BloC';
const kStateType = '...';

class Home extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: state.fontSize,
                  color: Colors.black,
                  fontWeight:
                      state.isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle:
                      state.isItalic ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
