import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainMenuText.dart';

Widget headerBox(BuildContext context) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: Colors.black.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.8),
      ),
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 3),
      //width: 320,
      width: SizeConfig.blockSizeHorizontal * 82,
      //height: 170,
      height: SizeConfig.blockSizeVertical * 23,
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 2,
            ),
            headerText(context, "US", SizeConfig.blockSizeHorizontal * 26,
                "AmericanDream", Colors.red[400]),
            headerText(
                context,
                "Capitals Quiz",
                SizeConfig.safeBlockHorizontal * 12,
                "Digitalt",
                Colors.blue[900]),
          ],
        ),
      )),
    ),
  );
}
