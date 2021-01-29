import 'package:Quiz_App/providers/mainMenuProvider.dart';
import 'package:Quiz_App/screens/mainMenuScreen/widgets/scoreBox.dart';
import 'package:Quiz_App/screens/mainMenuScreen/widgets/socialMediaButton.dart';
import 'package:Quiz_App/screens/mainMenuScreen/widgets/volumeButton.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainMenuRaisedButton.dart';
import 'mainMenuText.dart';

Widget mainColumn(BuildContext context, Function notifyListeners) {
  final prov = Provider.of<MainMenuProvider>(context);
  return Center(
    child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          volumeButton(context, notifyListeners),
          socialMediaButton(context, notifyListeners),
        ],
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 6),
      Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.black.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.8),
          ),
          margin: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 3),
          //width: 320,
          width: SizeConfig.blockSizeHorizontal * 83,
          //height: 170,
          height: SizeConfig.blockSizeVertical * 23,
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
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
      ),
      SizedBox(
        //  height: 40,
        height: SizeConfig.blockSizeVertical * 2,
      ),
      buildRaisedButton(
        "Play",
        () {
          prov.goToScreen("GameModeScreen", context);
        },
        Color(0xfff78df0).withOpacity(0.7),
        context,
      ),
      buildRaisedButton("Ranks", () {
        prov.goToScreen("AwardsScreen", context);
      }, Color(0xff8db2f7).withOpacity(0.9), context),
      SizedBox(
        // height: 20,
        height: SizeConfig.blockSizeHorizontal * 4,
      ),
      Container(
        //width: 250,
        width: SizeConfig.blockSizeHorizontal * 70,
        // height: 105,
        height: SizeConfig.blockSizeVertical * 14.5,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            border: Border.all(width: 4, color: Colors.black.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(10)),
        child: scoreBox(context),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 10,
      ),
    ]),
  );
}
