import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/shared/shadows.dart';

class LoadingCloudsDialog extends StatefulWidget {
  BuildContext dialogContext;
  bool isLoading;

  LoadingCloudsDialog(this.dialogContext, this.isLoading);
  @override
  _LoadingCloudsDialogState createState() => _LoadingCloudsDialogState();
}

class _LoadingCloudsDialogState extends State<LoadingCloudsDialog> {
  @override
  Widget build(BuildContext context) {
    loadingContext = context;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/clouds.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15)),
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
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 25,
                      width: SizeConfig.blockSizeHorizontal * 55,
                      child: Center(
                        child: Image(
                          image: AssetImage("images/rainbow.gif"),
                        ),
                      ),
                    ),
                    Text(
                      "Loading",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: SizeConfig.blockSizeHorizontal * 7,
                          shadows: nameShadows,
                          fontFamily: "Digitalt"),
                    )
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
