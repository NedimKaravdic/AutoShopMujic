import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget profileName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(userInstance.currentUser.displayName.split(" ")[0],
          style: TextStyle(
              fontFamily: "Nisebuschgardens",
              color: Colors.white,
              shadows: nameShadows,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
              letterSpacing: 1.5)),
      Text(
        userInstance.currentUser.displayName.split(" ")[1],
        style: TextStyle(
            fontFamily: "Nisebuschgardens",
            color: Colors.white,
            shadows: nameShadows,
            fontSize: SizeConfig.blockSizeHorizontal * 6,
            letterSpacing: 1.5),
      )
    ],
  );
}
