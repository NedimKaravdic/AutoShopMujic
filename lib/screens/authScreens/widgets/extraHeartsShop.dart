import 'package:Quiz_App/screens/authScreens/widgets/addPointsShop.dart';
import 'package:Quiz_App/screens/authScreens/widgets/extraLifeRow.dart';
import 'package:Quiz_App/screens/authScreens/widgets/extraPointsField.dart';
import 'package:flutter/material.dart';

Widget extraHearts(BuildContext context) {
  return Align(
    alignment: Alignment.topRight,
    child: StatefulBuilder(
      builder: (context, setState) {
        return Row(
          children: [
            addpointsShop(),
            extraLifesField(),
          ],
        );
      },
    ),
  );
}
