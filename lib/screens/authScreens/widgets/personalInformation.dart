import 'package:Quiz_App/screens/authScreens/widgets/profileName.dart';
import 'package:Quiz_App/screens/authScreens/widgets/profilePhoto.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget personalInformation(AsyncSnapshot<dynamic> snapshot) {
  return Container(
      padding: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 2),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.blue[900].withOpacity(0.6), width: 2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              profilePhoto(),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 3,
              ),
              profileName(),
            ],
          ),
          Container(
              margin:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
              child: Text(
                highScore.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Digitalt",
                    shadows: nameShadows,
                    letterSpacing: 2.0,
                    fontSize: SizeConfig.blockSizeHorizontal * 5),
              )),
        ],
      ));
}
