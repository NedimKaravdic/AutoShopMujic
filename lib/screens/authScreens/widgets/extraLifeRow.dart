import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget extraLifeRow(AsyncSnapshot<dynamic> snapshot) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      !snapshot.hasData
          ? SpinKitCubeGrid()
          : Text(
              snapshot.data.data()["extraLives"].toString(),
              style: TextStyle(
                fontFamily: "volkswagen-serial",
              ),
            ),
      SizedBox(
        width: SizeConfig.blockSizeHorizontal * 1,
      ),
      Padding(
        padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
        child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.favorite, color: Colors.red.withOpacity(0.9))),
      )
    ],
  );
}
