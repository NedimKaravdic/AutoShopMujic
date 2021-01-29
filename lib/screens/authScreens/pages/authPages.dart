import 'package:Quiz_App/screens/authScreens/widgets/socialMediaContainer.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget authPage(BuildContext context, Function function) {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 4,
                top: SizeConfig.blockSizeHorizontal * 9),
            width: SizeConfig.blockSizeHorizontal * 15,
            height: SizeConfig.blockSizeVertical * 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[900].withOpacity(0.8),
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical * 9),
        socialMediaContainer(context, function),
      ],
    ),
  );
}
