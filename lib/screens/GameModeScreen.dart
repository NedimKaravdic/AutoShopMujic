import 'package:Quiz_App/screens/PlayScreen.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GameModeScreen extends StatelessWidget {
  static const routeName = "/GameModeScreen";

  Widget buildRaisedButton(String text, Function function, double curscale) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: SizedBox(
            //width: 200,
            width: SizeConfig.blockSizeHorizontal * 60,
            // height: 80,

            child: Container(
              margin:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 5),
              child: RaisedButton(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "KronaOne",
                      fontSize: SizeConfig.blockSizeHorizontal * 6),
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
    SizeConfig().init(context);
    //Provider.of<Achievements>(context).checkforAchievement();
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
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 15,
                            height: SizeConfig.blockSizeVertical * 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(width: 4, color: Colors.black),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
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
                      height: SizeConfig.blockSizeVertical * 22,
                    ),
                    Text(
                      "Pick Your Game Mode",
                      style: TextStyle(
                          color: Colors.amber,
                          fontFamily: "Digitalt",
                          fontSize: SizeConfig.blockSizeHorizontal * 10,
                          shadows: sharedShadows),
                    ),
                    SizedBox(
                        //  height: 20,
                        height: SizeConfig.blockSizeHorizontal * 6),
                    Container(
                      height: SizeConfig.blockSizeVertical * 11,
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
                      height: SizeConfig.blockSizeVertical * 11,
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
