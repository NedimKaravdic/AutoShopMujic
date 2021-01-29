import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';

class VictoryDialog extends StatefulWidget {
  Function restart;
  bool isCancelable;
  bool isPoppable;
  int answeredCorrectly;
  final int screenScore;
  VictoryDialog(
      {@required this.isCancelable,
      @required this.screenScore,
      @required this.isPoppable,
      @required this.answeredCorrectly,
      @required this.restart});
  @override
  _VictoryDialogState createState() => _VictoryDialogState();
}

class _VictoryDialogState extends State<VictoryDialog> {
  void popFunction(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget rowItem(String label, String value) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white,
                shadows: nameShadows,
                fontFamily: "volkswagen-serial"),
          ),
          Text(
            value,
            style: TextStyle(
                color: Colors.white,
                shadows: nameShadows,
                fontFamily: "volkswagen-serial"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String correctly = widget.answeredCorrectly.toString() == null
        ? "0"
        : widget.answeredCorrectly.toString();

    return Container(
        height: SizeConfig.blockSizeVertical * 35,
        width: SizeConfig.blockSizeHorizontal * 5,
        child: Center(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
            child: Center(
                child: Column(
              children: [
                Text(
                  "CONGRATULATIONS !",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Digitalt",
                      shadows: sharedShadows,
                      fontSize: SizeConfig.blockSizeHorizontal * 7),
                ),
                Text(
                  "You answered $correctly / 50 correctly ",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Digitalt",
                      shadows: sharedShadows,
                      fontSize: SizeConfig.blockSizeHorizontal * 5),
                ),
              ],
            )),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1,
          ),
          Center(
            child: Container(
              height: SizeConfig.blockSizeVertical * 15,
              width: SizeConfig.blockSizeHorizontal * 50,
              child: Container(
                child: Image(
                  image: AssetImage("images/victoryGif.gif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                elevation: 10,
                color: Color(0xffa33135),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  widget.isPoppable = true;
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  widget.isCancelable = true;
                },
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 2,
              ),
              RaisedButton(
                elevation: 10,
                color: Color(0xffa33135),
                child: Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                onPressed: () {
                  widget.isPoppable = false;
                  widget.restart();
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ])));
  }
}
