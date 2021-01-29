import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildRaisedButton(String text, Function changeActivity,
    Color pickedColor, BuildContext context) {
  return SizedBox(
    width: SizeConfig.blockSizeHorizontal * 60,
    height: SizeConfig.blockSizeVertical * 10,
    child: Container(
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 3),
      child: RaisedButton(
          elevation: 20,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "KronaOne",
                  fontSize: SizeConfig.blockSizeHorizontal * 6),
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
