import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

final Map SOUNDS = {
  1: 'note1.wav',
  2: 'note2.wav',
  3: 'note3.wav',
  4: 'note4.wav',
  5: 'note5.wav',
  6: 'note6.wav',
  7: 'note7.wav',
};

class XylophoneApp extends StatelessWidget {
  void playSound([var filename = 'note1.wav']) {
    final player = AudioCache();
    player.play(filename);
  }

  Widget _getKeyButton(int key, Color color) {
    return Expanded(
      child: FlatButton(
        onPressed: () => playSound(SOUNDS[key]),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _getKeyButton(1, Colors.red),
              _getKeyButton(2, Colors.orange),
              _getKeyButton(3, Colors.yellow),
              _getKeyButton(4, Colors.lightGreen),
              _getKeyButton(5, Colors.green),
              _getKeyButton(6, Colors.blue),
              _getKeyButton(7, Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }
}
