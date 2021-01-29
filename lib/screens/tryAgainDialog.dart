import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';

class TryAgainDialog extends StatefulWidget {
  Function restart;
  bool isCancelable;
  bool isPoppable;
  final int screenScore;
  TryAgainDialog(
      {@required this.isCancelable,
      @required this.screenScore,
      @required this.isPoppable,
      @required this.restart});
  @override
  _TryAgainDialogState createState() => _TryAgainDialogState();
}

class _TryAgainDialogState extends State<TryAgainDialog> {
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
    String perecentage = "";
    switch (rank) {
      case "No Rank":
        perecentage = "0%";
        break;
      case "Toddler":
        perecentage = "5%";
        break;
      case "Tourist":
        perecentage = "10%";
        break;
      case "Student":
        perecentage = "15%";
        break;
      case "Citizen":
        perecentage = "20%";
        break;
      case "Patriot":
        perecentage = "25%";
        break;
    }
    return Container(
        height: SizeConfig.blockSizeVertical * 35,
        width: SizeConfig.blockSizeHorizontal * 5,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "You can do it better! ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Digitalt",
                          shadows: sharedShadows,
                          fontSize: SizeConfig.blockSizeHorizontal * 7),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Center(
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 15,
                        width: SizeConfig.blockSizeHorizontal * 30,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(60)),
                          child: Image(
                            image: AssetImage("images/tryAgainGif.gif"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Column(
                    children: [
                      rowItem(
                        "Score:",
                        widget.screenScore.toString(),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                      rowItem("Rank Bonus:", perecentage),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                      rowItem(
                          "Premium Bonus:", isPremium == true ? "1.5x" : "0x"),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 10,
                    color: Color(0xff244783),
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
                    width: 10,
                  ),
                  RaisedButton(
                    elevation: 10,
                    color: Color(0xff244783),
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
            ],
          ),
        ));
  }
}
