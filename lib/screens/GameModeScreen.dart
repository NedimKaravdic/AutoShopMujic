import 'package:Quiz_App/screens/PlayScreen.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/models/AchievementChecker.dart';
import 'package:provider/provider.dart';

class GameModeScreen extends StatelessWidget {
  static const routeName = "/GameModeScreen";

  Widget buildRaisedButton(String text, Function function, double curscale) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: SizedBox(
            //width: 200,
            width: constraints.maxWidth * 0.6,
            // height: 80,

            child: Container(
              margin: EdgeInsets.only(bottom: 18),
              child: RaisedButton(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "KronaOne",
                      fontSize: 25 * curscale),
                ),
                onPressed: () {
                  function();
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<Achievements>(context).checkforAchievement();
    Provider.of<Achievements>(context).returnTrue();
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/gameModeScreen.jpg"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth * 0.13,
                            height: constraints.maxHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(width: 4, color: Colors.black),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_left,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      //height: 180,
                      height: constraints.maxHeight * 0.253,
                    ),
                    Text(
                      "Pick Your Game Mode",
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: "Digitalt",
                        fontSize: 40 * curScaleFactor,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.black),
                        ],
                      ),
                    ),
                    SizedBox(
                      //  height: 20,
                      height: constraints.maxHeight * 0.031,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.113,
                      child: buildRaisedButton("Normal", () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return PlayScreen(
                            gameMode: 3,
                          );
                        }));
                      }, curScaleFactor),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.113,
                      child: buildRaisedButton("Challenge", () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return PlayScreen(
                            gameMode: 1,
                          );
                        }));
                      }, curScaleFactor),
                    ),
                    SizedBox(
                      //height: 220,
                      height: constraints.maxHeight * 0.31,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
