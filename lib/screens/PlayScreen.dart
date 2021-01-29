import 'package:Quiz_App/services/updateRankFunction.dart';
import 'package:Quiz_App/shared/alertDialogServices.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/widgets/AnswerTab.dart';
import 'package:Quiz_App/widgets/HealthStatus.dart';
import 'package:Quiz_App/widgets/PicturePlace.dart';
import 'package:provider/provider.dart';
import 'package:Quiz_App/models/USstates.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Quiz_App/services/calculateRank.dart';
import 'dart:math';
import 'package:confetti/confetti.dart';

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
  bool victory = false;
  ConfettiController _controllerCenter;
  List<String> correct = [];
  void reduceHealth() {
    if (victory != true)
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

  void resumeGame() {
    health++;
    seconds = 10;
    startTimer();
  }

  startTimer() {
    const second = Duration(seconds: 1);
    timer = new Timer.periodic(second, (timer) {
      if (health != 0) {
        if (seconds == 0 && victory == false) {
          timer.cancel();
          health -= 1;

          if (health == 0) {
            seconds = 10;
          } else {
            seconds = 5;
          }

          nextState(false);
        } else {
          if (this.mounted) {
            setState(() {
              print(seconds.toString() + "asfafsafsafasa");

              seconds--;

              if (widget.gameMode == 1) {
                final int hardCoreScore = seconds * 10 + 5 * index;
                score += hardCoreScore * 10;
                score += calculateRank(rank, score);
                if (isPremium == true) {
                  double doubleScore = score.toDouble();
                  doubleScore *= 1.5;
                  score = doubleScore.toInt();
                }
              } else {
                score = seconds * 10 + 5 * index;
                score += calculateRank(rank, score);
                if (isPremium == true) {
                  double doubleScore = score.toDouble();
                  doubleScore *= 1.5;
                  score = doubleScore.toInt();
                }
              }
              print(score.toString() + "AHAHAHAHH");
            });
          }
        }
      }
    });
  }

  void nextState(bool answerType) {
    if (victory == true) {
      timer.cancel();
      victoryDialog(
          context, isCancelable, screenScore, restartGame, correct.length);
      _controllerCenter.play();
    }

    if (health == 0) {
      timer.cancel();

      if (extraLives == 0) {
        showAlertDialogFunc(context, isCancelable, score, restartGame);
      } else {
        extraLifesDialog(
            context, isCancelable, screenScore, restartGame, resumeGame);
      }
    } else {
      if (victory == false) {
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
        widget.gameMode == 1 ? seconds = 5 : seconds = 10;
        isNotClickable = false;
      } else {
        if (answerType == true) {
          setState(() {
            screenScore += score;
          });
        }
      }
    }
  }

  void initAction() async {
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
      print("ADAFAFAS");
      switch (correct.length) {
        case 10:
          if (prefs.getBool("Toddler") == null) {
            prefs.setString("Rank", "Toddler");
            prefs.setBool("Toddler", true);
          }
          updateRankFunction("Toddler");

          break;
        case 20:
          if (prefs.getBool("Tourist") == null) {
            prefs.setString("Rank", "Tourist");
            prefs.setBool("Tourist", true);
          }
          updateRankFunction("Tourist");
          break;
        case 30:
          if (prefs.getBool("Student") == null) {
            prefs.setString("Rank", "Student");
            prefs.setBool("Student", true);
          }
          updateRankFunction("Student");
          break;
        case 40:
          if (prefs.getBool("Citizen") == null) {
            prefs.setString("Rank", "Citizen");
            prefs.setBool("Citizen", true);
          }
          updateRankFunction("Citizen");
          break;
        case 50:
          if (prefs.getBool("Patriot") == null) {
            prefs.setString("Rank", "Patriot");
            prefs.setBool("Patriot", true);
          }
          updateRankFunction("Patriot");
      }
    }
  }

  @override
  void initState() {
    super.initState();

    health = widget.gameMode;
    if (widget.gameMode == 1) {
      seconds = 5;
    } else {
      seconds = 10;
    }
    initAction();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  void triggerCorrectFirst() {
    if (widget.gameMode == 1) {
      if (seconds == 5) {
        if (index == 0) {
          final int hardCoreScore = seconds * 10 + 5 * 1;
          score = hardCoreScore * 10;
          score = calculateRank(rank, score);
        } else {
          final int hardCoreScore = seconds * 10 + 5 * index;
          score = hardCoreScore * 10;
          score = calculateRank(rank, score);
        }

        if (isPremium == true) {
          double doubleScore = score.toDouble();
          doubleScore *= 1.5;
          score = doubleScore.toInt();
        }
      }
    } else {
      if (seconds == 10) {
        if (index == 0) {
          score = seconds * 10 + 5 * 1;
        } else {
          score = seconds * 10 + 5 * index;
        }
        //score = seconds * 10 + 5 * index;
        score = calculateRank(rank, score);
        if (isPremium == true) {
          double doubleScore = score.toDouble();
          doubleScore *= 1.5;
          score = doubleScore.toInt();
        }
      }
    }
  }

  void restartGame() {
    score = 0;
    health = 3;
    screenScore = 0;
    correct = [];

    startTimer();
    final stateProvider =
        Provider.of<StatesList>(context, listen: false).unShuffledStates;
    capitalCity = stateProvider[index].capitalCity;
    stateImage = stateProvider[index].image;
    stateName = stateProvider[index].stateName;
    stateProvider[index].givenCities.shuffle();
    cities = stateProvider[index].givenCities;
    index = 0;

    setState(() {});
  }

  Future<void> setHighScore() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final res = preferences.getInt("high_score");
    if (screenScore > res) {
      preferences.remove("high_score");
      preferences.setInt("high_score", screenScore);
      highScore = preferences.getInt("high_score");
      preferences.remove("last_game_score");
      preferences.setString("last_game_score", screenScore.toString());
      lastGameScore = preferences.getString("last_game_score");

      firestoreInstance
          .collection("users")
          .doc(userID)
          .update({"highScore": highScore, "lastGameScore": lastGameScore});
    } else {
      preferences.remove("last_game_score");
      preferences.setString("last_game_score", screenScore.toString());
      lastGameScore = preferences.getString("last_game_score");

      firestoreInstance
          .collection("users")
          .doc(userInstance.currentUser.uid)
          .update({"lastGameScore": screenScore.toString()});
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(index);

    if (index == 49 && health != 0) {
      victory = true;
      print("Victory");
    }

    check();

    return SafeArea(
      child: Scaffold(
        body: ConfettiWidget(
          shouldLoop: false,
          confettiController: _controllerCenter,
          emissionFrequency: 0.01,
          numberOfParticles: 30,
          blastDirection: 0,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/playScreen.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Score:", style: Theme.of(context).textTheme.headline3),
                Container(
                  height: SizeConfig.blockSizeVertical * 10,
                  child: HealthStatus(
                    screenScore: screenScore,
                    health: health,
                    seconds: seconds,
                    function: setHighScore,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 4, // height: 30
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 9,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2,
                              left: SizeConfig.blockSizeHorizontal * 4,
                              right: SizeConfig.blockSizeHorizontal * 4,
                              bottom: SizeConfig.blockSizeVertical * 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2),
                              color: Colors.white.withOpacity(0.9)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 2),
                            child: Text("What is  the capital of",
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 8,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                    shadows: sharedShadows,
                                    fontFamily: 'Nisebuschgardens')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    //height: 20,
                    height: SizeConfig.blockSizeVertical * 3),
                PicturePlace(
                  image: stateImage,
                ),
                Container(
                    height: SizeConfig.blockSizeVertical * 9,
                    margin:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                    child: Center(
                      child: Text(stateName,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              shadows: sharedShadows,
                              fontFamily: 'Nisebuschgardens')),
                    )),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeHorizontal * 2),
                      width: SizeConfig.blockSizeHorizontal * 70,
                      height: SizeConfig.blockSizeHorizontal * 75,
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
                        trigger: triggerCorrectFirst,
                        victory: victory,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
