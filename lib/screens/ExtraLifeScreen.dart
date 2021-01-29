import 'package:Quiz_App/screens/tryAgainDialog.dart';
import 'package:Quiz_App/shared/alertDialogServices.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/models/CustomTimerPainter.dart';

class ExtraLifeScreen extends StatefulWidget {
  bool isCancelable;
  int score;
  Function restart;
  ExtraLifeScreen(
      {@required this.isCancelable,
      @required this.score,
      @required this.restart});
  @override
  _ExtraLifeScreenState createState() => _ExtraLifeScreenState();
}

class _ExtraLifeScreenState extends State<ExtraLifeScreen> {
  void popFunction(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.blockSizeVertical * 35,
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
                  child: Text(
                    "Watch Ad For Extra Life ?",
                    style: TextStyle(
                        color: Colors.white,
                        shadows: nameShadows,
                        fontFamily: "Digitalt",
                        fontSize: SizeConfig.blockSizeHorizontal * 6),
                  ),
                ),
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
                      tryAgainDialog(
                          context, false, widget.score, widget.restart);
                      Navigator.of(context).pop();
                      //   widget.isCancelable = true;
                    },
                  ),
                  SizedBox(
                    width: 10,
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
                          shadows: sharedShadows),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
