import 'package:flutter/material.dart';
import 'package:Quiz_App/models/USstates.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';

class AnswerTab extends StatefulWidget {
  final Function(bool answerType) nextState;
  final int index;
  final List<String> states;
  final String capitalCity;
  final String stateName;
  final Function reduceHealth;
  int screenScore;
  final int score;
  bool isNotClickable;
  Timer newTimer;
  int seconds;
  int health;
  List<String> correct;

  AnswerTab({
    @required this.nextState,
    @required this.index,
    @required this.states,
    @required this.capitalCity,
    @required this.stateName,
    @required this.reduceHealth,
    @required this.screenScore,
    @required this.score,
    @required this.isNotClickable,
    @required this.newTimer,
    @required this.seconds,
    @required this.health,
    @required this.correct,
  });

  @override
  _AnswerTabState createState() => _AnswerTabState();
}

class _AnswerTabState extends State<AnswerTab> {
  Color correctColor = Colors.green;
  Color wrongColor = Colors.red;
  Color color = Colors.white;
  String index;
  double hajt;
  bool clickPeriod = false;
  bool time = true;

  Map<String, Color> colors = {
    'color0': Colors.white,
    'color1': Colors.white,
    'color2': Colors.white,
    'color3': Colors.white,
    'green': Colors.green,
  };

  Map<String, Color> textColors = {
    'txtColor0': Colors.black,
    'txtColor1': Colors.black,
    'txtColor2': Colors.black,
    'txtColor3': Colors.black,
    'text': Colors.white,
  };

  void registerClick(String city, String colorIndex, String txtColorIndex,
      double btnHeight, bool time) {
    if (city != widget.capitalCity) {
      print("Wrong");
      AssetsAudioPlayer.newPlayer().open(Audio("sounds/wrong.mp3"));
      widget.newTimer.cancel();
      clickPeriod = true;
      colors[colorIndex] = wrongColor;
      widget.isNotClickable = true;

      Timer(Duration(milliseconds: 1800), () {
        widget.reduceHealth();
        colors[colorIndex] = color;
        clickPeriod = false;
        widget.nextState(false);
      });
    } else {
      if (widget.health != 0) {
        print("True");
        time
            ? AssetsAudioPlayer.newPlayer().open(Audio("sounds/correct.mp3"))
            : AssetsAudioPlayer.newPlayer().open(Audio("sounds/wrong.mp3"));
        widget.newTimer.cancel();
        clickPeriod = true;
        widget.isNotClickable = true;
        Timer(Duration(milliseconds: 1800), () {
          time ? print("Neda je King") : widget.reduceHealth();
          colors[colorIndex] = color;
          textColors[txtColorIndex] = Colors.black;
          clickPeriod = false;
          time ? widget.nextState(true) : widget.nextState(false);
        });
        time
            ? widget.correct.add(widget.capitalCity)
            : print("No correct Answer");
        textColors[txtColorIndex] = Colors.white;
        colors[colorIndex] = correctColor;
      }
    }
  }

  Widget buildRaisedButton(
    String text,
    String colorIndex,
    String txtColorIndex,
    double btnHeight,
  ) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(vertical: 3),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.black, width: 2)),
        color: clickPeriod && text == widget.capitalCity
            ? Colors.green
            : colors[colorIndex],
        elevation: 10,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'volkswagen-serial',
              fontWeight: FontWeight.bold,
              color: clickPeriod && text == widget.capitalCity
                  ? Colors.white
                  : textColors[txtColorIndex],
              fontSize: 20),
        ),
        onPressed: widget.isNotClickable
            ? () {}
            : () {
                setState(() {
                  registerClick(
                      text, colorIndex, txtColorIndex, btnHeight, true);
                });
              },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.seconds == 0) {
      registerClick(widget.capitalCity, "green", "txt", 0, false);
    }
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          buildRaisedButton(widget.states[0], 'color0', 'txtColor0', hajt),
          buildRaisedButton(widget.states[1], 'color1', 'txtColor1', hajt),
          buildRaisedButton(widget.states[2], 'color2', 'txtColor2', hajt),
          buildRaisedButton(widget.states[3], 'color3', 'txtColor3', hajt),
        ],
      ),
    );
  }
}
