import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:Quiz_App/screens/AwardsScreen.dart';
import 'package:Quiz_App/screens/GameModeScreen.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

Widget buildRaisedButton(String text, Function changeActivity,
    Color pickedColor, BuildContext context) {
  return SizedBox(
    width: 200,
    height: 80,
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
          elevation: 20,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontFamily: "KronaOne", fontSize: 25),
            ),
          ),
          onPressed: () {
            changeActivity();
          },
          color: pickedColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(10))),
    ),
  );
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  String prf;
  String lastGameScoretxt;

  Future<String> getLastGameScore() async {
    final prefs = await SharedPreferences.getInstance();
    final lastGameScore = prefs.getString("last_game_score");

    lastGameScoretxt = lastGameScore;

    if (lastGameScore == null) {
      lastGameScoretxt = "0";

      return lastGameScoretxt;
    } else {
      return lastGameScoretxt;
    }
  }

  Future<String> getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    final highScore = prefs.getString("high_score");

    prf = highScore;

    if (highScore == null) {
      prf = "0";

      prefs.setString("high_score", prf);
      print(prf);

      return prf;
    } else {
      prf = highScore;

      print(prf);
      return prf;
    }
  }

  void goToScreen(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Navigator.of(context).pushNamed(routeName);
    if (screenName == "GameModeScreen") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return GameModeScreen();
      })).then((value) {
        setState(() {
          prf = prefs.getString("high_score");
          lastGameScoretxt = prefs.getString("last_game_score");
        });
      });
    } else if (screenName == "AwardsScreen") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return RewardScreen();
        },
      )).then((value) {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (prf == null) {
      getHighScore().then((value) {
        setState(() {});
      });
      getLastGameScore().then((value) {
        setState(() {});
      });
    }

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (builder, constraints) {
            return Container(
              height: constraints.maxHeight * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/mainMenu.jpg"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4, color: Colors.black.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.8),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          //width: 320,
                          width: constraints.maxWidth * 0.82,
                          //height: 170,
                          height: constraints.maxHeight * 0.24,
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "US",
                                  style: TextStyle(
                                      fontSize: 90,
                                      fontFamily: "AmericanDream",
                                      color: Colors.red[400]),
                                ),
                                Text(
                                  "Capitals Quiz",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: "Digitalt",
                                      color: Colors.blue[900]),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        //  height: 40,
                        height: constraints.maxHeight * 0.04,
                      ),
                      buildRaisedButton(
                        "Play",
                        () {
                          goToScreen("GameModeScreen");
                        },
                        Color(0xfff78df0).withOpacity(0.7),
                        context,
                      ),
                      buildRaisedButton("Awards", () {
                        goToScreen("AwardsScreen");
                      }, Color(0xff8db2f7).withOpacity(0.9), context),
                      SizedBox(
                        // height: 20,
                        height: constraints.maxHeight * 0.03,
                      ),
                      Container(
                        //width: 250,
                        width: constraints.maxWidth * 0.64,
                        // height: 105,
                        height: constraints.maxHeight * 0.15,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            border: Border.all(
                                width: 4, color: Colors.black.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 2,
                              ),
                              child: Text(
                                "High Score:",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 20,
                                    fontFamily: "Digitalt"),
                              ),
                            ),
                            Text(
                              prf == null ? "0" : prf,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              "Last Game Score:",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 20,
                                  fontFamily: "Digitalt"),
                            ),
                            Text(
                              lastGameScoretxt == null ? "0" : lastGameScoretxt,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
