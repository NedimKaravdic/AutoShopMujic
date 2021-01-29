import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/shared/shadows.dart';

class CloudsDialog extends StatefulWidget {
  BuildContext dialogContext;
  bool isLoading;

  CloudsDialog(this.dialogContext, this.isLoading);
  @override
  _CloudsDialogState createState() => _CloudsDialogState();
}

class _CloudsDialogState extends State<CloudsDialog> {
  void popFunction(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/clouds.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15)),
        height: SizeConfig.blockSizeVertical * 33,
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
                      "Please Check Your Internet",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontFamily: "Digitalt",
                          shadows: sharedShadows,
                          fontSize: SizeConfig.blockSizeHorizontal * 5),
                    ),
                    Text(
                      "Connection and try again",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontFamily: "Digitalt",
                          shadows: sharedShadows,
                          fontSize: SizeConfig.blockSizeHorizontal * 6),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 18,
                      width: SizeConfig.blockSizeHorizontal * 55,
                      child: Center(
                        child: Image(
                          image: AssetImage("images/rainbow.gif"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: false).pop();
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontFamily: "Digitalt",
                            fontSize: SizeConfig.safeBlockHorizontal * 7,
                            shadows: nameShadows),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
