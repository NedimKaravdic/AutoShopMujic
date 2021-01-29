import 'package:Quiz_App/screens/authScreens/mainAuthScreen.dart';
import 'package:Quiz_App/shared/alertDialogServices.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/shared/checkConnectivity.dart';

Widget socialMediaButton(BuildContext context, Function notifyListeners) {
  return Align(
    alignment: Alignment.topLeft,
    child: GestureDetector(
      onTap: () async {
        if (await checkConnectivity() == true) {
          Navigator.of(context)
              .pushNamed(MainAuthScreen.routeName)
              .then((value) {
            notifyListeners();
          });
        } else {
          cloudsDialog(context, false);
        }
        // checkConnectivity();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3),
        width: SizeConfig.blockSizeHorizontal * 15,
        height: SizeConfig.blockSizeVertical * 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[900].withOpacity(0.8),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: Icon(
            Icons.people,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
