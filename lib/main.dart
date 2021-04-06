import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XyloApp());

class XyloApp extends StatefulWidget {
  @override
  _XyloAppState createState() => _XyloAppState();
}

class _XyloAppState extends State<XyloApp> {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('assets_note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber, int noteNumber}) {
    return Expanded(
      // ignore: deprecated_member_use
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(
          'Note$soundNumber',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Center(
              child: Text(
            'XyloPhone',
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.orangeAccent,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildKey(color: Colors.blueAccent, soundNumber: 1),
                  buildKey(color: Colors.redAccent, soundNumber: 2),
                  buildKey(color: Colors.greenAccent, soundNumber: 3),
                  buildKey(color: Colors.pink, soundNumber: 4),
                  buildKey(color: Colors.yellowAccent, soundNumber: 5),
                  buildKey(color: Colors.blue, soundNumber: 6),
                  buildKey(color: Colors.orangeAccent, soundNumber: 7)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
