import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  static AudioCache player = AudioCache();

  void playSound(int soundNumber) {
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(soundNumber);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.indigo, soundNumber: 1),
              buildKey(color: Colors.blue[900], soundNumber: 2),
              buildKey(color: Colors.blue[300], soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.yellow, soundNumber: 5),
              buildKey(color: Colors.orange, soundNumber: 6),
              buildKey(color: Colors.red, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
