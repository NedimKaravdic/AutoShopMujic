import 'package:Quiz_App/screens/authScreens/widgets/personalInformation.dart';
import 'package:Quiz_App/screens/authScreens/widgets/profileName.dart';
import 'package:Quiz_App/screens/authScreens/widgets/profilePhoto.dart';
import 'package:Quiz_App/screens/authScreens/widgets/rankingListAppBar.dart';
import 'package:Quiz_App/screens/authScreens/widgets/rankingPageBackButton.dart';
import 'package:Quiz_App/screens/authScreens/widgets/topRankingList.dart';
import 'package:Quiz_App/screens/authScreens/widgets/topTen.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget rankingColumn(BuildContext context, ScrollController controller) {
  return StreamBuilder(
    stream: firestoreInstance
        .collection("users")
        .orderBy("highScore", descending: true)
        .limit(10)
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.blue[900].withOpacity(0.6), width: 2),
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: SizeConfig.blockSizeVertical * 93,
            child: Center(
                child: Image(
              image: AssetImage("images/rainbowLoading.gif"),
            )));
      } else {
        return Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Container(
              margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue[900].withOpacity(0.6), width: 2),
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              height: SizeConfig.blockSizeVertical * 93,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  rankingListAppBar(context),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 4,
                  ),
                  personalInformation(snapshot),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 4,
                  ),
                  topTen(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return;
                    },
                    child: FadingEdgeScrollView.fromScrollView(
                        gradientFractionOnEnd: 0.1,
                        gradientFractionOnStart: 0.05,
                        child: topRankingList(controller, snapshot)),
                  )),
                ],
              ),
            )
          ],
        );
      }
    },
  );
}
