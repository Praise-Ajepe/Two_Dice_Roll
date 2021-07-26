// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:path_provider/path_provider.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Roll D Dice!'),
          leading: Icon(Icons.grid_view),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  String result = '1';
  String result2 = '1';
  void changeDice() {
    leftDice = Random().nextInt(6) + 1;
    rightDice = Random().nextInt(6) + 1;
  }

  void diceValue() {
    switch (leftDice) {
      case 1:
        result = '1';
        break;
      case 2:
        result = '2';
        break;
      case 3:
        result = '3';
        break;
      case 4:
        result = '4';
        break;
      case 5:
        result = '5';
        break;
      case 6:
        result = '6';
        break;
      default:
        result = '';
    }
  }

  void diceValue2() {
    switch (rightDice) {
      case 1:
        result2 = '1';
        break;
      case 2:
        result2 = '2';
        break;
      case 3:
        result2 = '3';
        break;
      case 4:
        result2 = '4';
        break;
      case 5:
        result2 = '5';
        break;
      case 6:
        result2 = '6';
        break;
      default:
        result = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      /*Text here displays the dice figures (1:1,6:2).
                       I need to position this text at center of this container
                       */
                      child: Text('$result : $result2',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 80.0,
                          )),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[
              /*Images contained in this expanded widget is not displaying,
              Image director is in project level directory in assets.
               */

              Expanded(
                child: TextButton(
                  child: Image.asset('images/dice$leftDice.png'),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('images/dice$rightDice.png'),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              child: Text('Roll Dice'),
              onPressed: () {
                // final player = AudioCache();
                // await player.play('MANYDICE.WAV', mode: PlayerMode.LOW_LATENCY);

                setState(() {
                  changeDice();
                  diceValue();
                  diceValue2();
                });
              },
            ),
          ),
          Text(
            'Don\'t give up rolling!',
            style: TextStyle(
              backgroundColor: Colors.white,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
