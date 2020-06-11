import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(BossApp());
}

class BossApp extends StatefulWidget {
  @override
  _BossAppState createState() => _BossAppState();
}

class _BossAppState extends State<BossApp> {
  int imageNum = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: Text('Boss App'),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {
              setState(() {
                imageNum = Random().nextInt(5) + 1;
              });
            },
            child: Image.asset('images/ball$imageNum.png'),
          ),
        ),
      ),
    );
  }
}
