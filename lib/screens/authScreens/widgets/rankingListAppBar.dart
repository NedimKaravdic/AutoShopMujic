import 'package:Quiz_App/screens/authScreens/widgets/extraHeartsShop.dart';
import 'package:Quiz_App/screens/authScreens/widgets/rankingPageBackButton.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget rankingListAppBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      rankingPageBackButton(context),
      extraHearts(context),
    ],
  );
}
