import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

Widget addpointsShop() {
  return GestureDetector(
    onTap: () async {
      await rewardedVideoAd.show().catchError((e) => print(e));
    },
    child: Container(
      height: SizeConfig.blockSizeVertical * 4,
      width: SizeConfig.blockSizeHorizontal * 6,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          border: Border(
              left: BorderSide(width: 2, color: Colors.pink.withOpacity(0.4)),
              top: BorderSide(width: 2, color: Colors.pink.withOpacity(0.4)),
              bottom: BorderSide(width: 2, color: Colors.pink.withOpacity(0.4)),
              right: BorderSide(width: 2, color: Colors.pink.withOpacity(0.4))),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), topLeft: Radius.circular(8))),
      child: Icon(
        Icons.add_circle_outline,
        size: SizeConfig.blockSizeHorizontal * 5,
        color: Colors.pink.withOpacity(0.4),
      ),
    ),
  );
}
