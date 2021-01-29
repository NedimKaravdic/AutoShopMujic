import 'package:Quiz_App/screens/tryAgainDialog.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/models/CustomTimerPainter.dart';
import 'package:Quiz_App/shared/alertDialogServices.dart';

class SpendExtraLives extends StatefulWidget {
  bool isCancelable;
  Function restart;
  bool isPoppable;
  Function resume;
  final int screenScore;
  SpendExtraLives(
      {@required this.isCancelable,
      @required this.screenScore,
      @required this.isPoppable,
      @required this.resume,
      @required this.restart});
  @override
  _SpendExtraLivesState createState() => _SpendExtraLivesState();
}

class _SpendExtraLivesState extends State<SpendExtraLives> {
  void popFunction(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.blockSizeVertical * 37,
        width: SizeConfig.blockSizeHorizontal * 5,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/clouds.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "Spend One Extra Life",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Digitalt",
                          shadows: nameShadows,
                          fontSize: SizeConfig.blockSizeHorizontal * 6),
                    ),
                    Text(
                      "To Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Digitalt",
                          shadows: nameShadows,
                          fontSize: SizeConfig.blockSizeHorizontal * 6),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              Center(child: CircularTimer()),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 10,
                    color: Colors.red,
                    child: Text(
                      "NO",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Digitalt",
                          fontSize: SizeConfig.blockSizeHorizontal * 6,
                          shadows: sharedShadows),
                    ),
                    onPressed: () {
                      widget.isPoppable = false;
                      tryAgainDialog(context, widget.isCancelable,
                              widget.screenScore, widget.restart)
                          .then((value) => Navigator.of(context).pop());
//Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 3,
                  ),
                  RaisedButton(
                    elevation: 10,
                    color: Colors.green,
                    child: Text(
                      "YES",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Digitalt",
                        fontSize: SizeConfig.blockSizeHorizontal * 6,
                        shadows: sharedShadows,
                      ),
                    ),
                    onPressed: () {
                      extraLives -= 1;
                      prefs.setInt("extraLives", extraLives);
                      firestoreInstance
                          .collection("users")
                          .doc(uid)
                          .update({"extraLives": extraLives});
                      widget.resume();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
