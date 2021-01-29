import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget topTen() {
  return Center(
    child: Text(
      "TOP TEN",
      style: TextStyle(
          color: Colors.yellow[800],
          fontFamily: "ShinySignature",
          shadows: sharedShadows,
          fontSize: SizeConfig.blockSizeHorizontal * 10),
    ),
  );
}



