import 'package:Quiz_App/screens/ExtraLifeScreen.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/widgets/AnswerTab.dart';
import 'package:Quiz_App/widgets/HealthStatus.dart';
import 'package:Quiz_App/widgets/PicturePlace.dart';
import 'package:provider/provider.dart';
import 'package:Quiz_App/models/USstates.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Quiz_App/models/CustomTimerPainter.dart';
import 'package:Quiz_App/screens/ExtraLifeScreen.dart';

class PlayScreen extends StatefulWidget {
  static const String routeName = "/PlayScreen";
  int gameMode;
  PlayScreen({@required this.gameMode});
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int index = 0;
  String state;
  int seconds;
  int health = 3;
  bool isInit = true;
  String stateImage;
  int score = 0;
  int screenScore = 0;
  String capitalCity;
  String stateName;
  List<String> cities;
  Timer timer;
  bool previousAnswer;
  bool isNotClickable = false;
  bool isCancelable;
  List<String> correct = [];
  void reduceHealth() {
    setState(() {
      if (health != 0) health -= 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
    setHighScore();
    timer.cancel();
  }

  void startTimer() {
    const second = Duration(seconds: 1);
    timer = new Timer.periodic(second, (timer) {
      if (health != 0) {
        if (seconds == 0) {
          timer.cancel();
          health -= 1;

          if (health == 0) {
            seconds = 15;
          } else {
            seconds = 7;
          }

          nextState(false);
        } else {
          setState(() {
            seconds--;
            score = seconds * 10 + 5 * index;
          });
        }
      }
    });
  }

  void nextState(bool answerType) {
    if (health == 0) {
      timer.cancel();
      showAlertDialog(
        context,
      );
    } else {
      startTimer();
      setState(() {
        index++;

        if (answerType == true) {
          screenScore += score;
        }

        final stateProvider =
            Provider.of<StatesList>(context, listen: false).unShuffledStates;
        capitalCity = stateProvider[index].capitalCity;
        stateImage = stateProvider[index].image;
        stateName = stateProvider[index].stateName;
        stateProvider[index].givenCities.shuffle();
        cities = stateProvider[index].givenCities;
      });
      widget.gameMode == 1 ? seconds = 7 : seconds = 15;
      isNotClickable = false;
    }
  }

  void initAction() {
    startTimer();
    final stateProvider =
        Provider.of<StatesList>(context, listen: false).states;
    capitalCity = stateProvider[index].capitalCity;
    stateImage = stateProvider[index].image;
    stateName = stateProvider[index].stateName;
    stateProvider[index].givenCities.shuffle();
    cities = stateProvider[index].givenCities;
    stateProvider.forEach((element) {
      print(element.stateName);
    });
  }

  void check() async {
    if (correct.length == 10 ||
        correct.length == 20 ||
        correct.length == 30 ||
        correct.length == 40 ||
        correct.length == 50) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      switch (correct.length) {
        case 10:
          prefs.setBool("Toddler", true);
          break;
        case 20:
          prefs.setBool("Tourist", true);
          break;
        case 30:
          prefs.setBool("Student", true);
          break;
        case 40:
          prefs.setBool("Citizen", true);
          break;
        case 50:
          prefs.setBool("Patriot", true);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    health = widget.gameMode;
    if (widget.gameMode == 1) {
      seconds = 7;
    } else {
      seconds = 999;
    }
    initAction();
  }

  Future<void> setHighScore() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final res = int.parse(preferences.getString("high_score"));
    if (screenScore > res) {
      preferences.remove("high_score");
      preferences.setString("high_score", screenScore.toString());
      preferences.remove("last_game_score");
      preferences.setString("last_game_score", screenScore.toString());
    } else {
      preferences.remove("last_game_score");
      preferences.setString("last_game_score", screenScore.toString());
    }
  }

  showAlertDialog(
    BuildContext context,
  ) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side:
                    BorderSide(width: 4, color: Colors.black.withOpacity(0.7))),
            child: ExtraLifeScreen(
              isCancelable: isCancelable,
            ),
          );
        }).then((value) {
      if (isCancelable = true) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(index);
    if (index == 50 && health < 0) {
      print("Victory");
      timer.cancel();
    }

    check();

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/playScreen.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Score:", style: Theme.of(context).textTheme.headline3),
                  Container(
                    height: constraints.maxHeight * 0.1,
                    child: HealthStatus(
                      screenScore: screenScore,
                      health: health,
                      seconds: seconds,
                      function: setHighScore,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.040, // height: 30
                  ),
                  Container(
                    height: constraints.maxHeight * 0.080,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2),
                                color: Colors.white.withOpacity(0.9)),
                            child: Container(
                              child: Text("What is  the capital of",
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    //height: 20,
                    height: constraints.maxHeight * 0.028,
                  ),
                  PicturePlace(
                    image: stateImage,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.054,
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(stateName,
                            style: Theme.of(context).textTheme.headline2),
                      )),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: constraints.maxWidth * 0.73,
                        height: 250,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(30)),
                        child: AnswerTab(
                          nextState: nextState,
                          index: index,
                          states: cities,
                          capitalCity: capitalCity,
                          stateName: stateName,
                          reduceHealth: reduceHealth,
                          screenScore: screenScore,
                          score: score,
                          isNotClickable: isNotClickable,
                          newTimer: timer,
                          seconds: seconds,
                          health: health,
                          correct: correct,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
