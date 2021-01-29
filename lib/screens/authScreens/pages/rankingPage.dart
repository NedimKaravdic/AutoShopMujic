import 'package:Quiz_App/screens/authScreens/pages/rankingColumn.dart';
import 'package:Quiz_App/screens/authScreens/widgets/rankingPageBackButton.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'dart:io';

Widget rankingPage(BuildContext context) {
  print(isPremium);
  final _controller = ScrollController();
  print(photoURL.toString());
  rewardedVideoAd.load(
      adUnitId: 'ca-app-pub-8549613552572730/3184267628',
      targetingInfo: targetingInfo);

  // RewardedVideoAd.testAdUnitId);
  return Center(child: rankingColumn(context, _controller));
}
