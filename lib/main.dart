import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note$soundNumber.wav'),
    );
  }

  Expanded buildKey(int soundNumber, Color color, String text) {
    return Expanded(
        child: FilledButton(
          child: Text(text),
          style: FilledButton.styleFrom(backgroundColor: color),
          onPressed: () {
            playSound(soundNumber);
          },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Center(
            child: Text(
              'Music',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 40.0
              ),
            ),
          ),
        ),
        backgroundColor: Colors.cyan,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildKey(1, Colors.red, 'Red'),
              buildKey(2, Colors.orange, 'Orange'),
              buildKey(3, Colors.yellow, 'Yellow'),
              buildKey(4, Colors.green, 'Green'),
              buildKey(5, Colors.teal, 'Teal'),
              buildKey(6, Colors.blue, 'Blue'),
              buildKey(7, Colors.purple, 'Purple'),
            ],
          ),
        ),
      ),
    );
  }
}