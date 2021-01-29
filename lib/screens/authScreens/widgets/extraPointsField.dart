import 'package:Quiz_App/screens/authScreens/widgets/extraLifeRow.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget extraLifesField() {
  return GestureDetector(
    onTap: () {},
    child: StreamBuilder(
      stream: firestoreInstance
          .collection("users")
          .doc(userInstance.currentUser.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
            height: SizeConfig.blockSizeVertical * 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.8),
              border: Border.all(width: 2, color: Colors.pink.withOpacity(0.5)),
            ),
            child: Container(
              padding:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
              child: Center(
                child: Row(
                  children: [
                    extraLifeRow(snapshot),
                  ],
                ),
              ),
            ),
          );
        }
      },
    ),
  );
}
