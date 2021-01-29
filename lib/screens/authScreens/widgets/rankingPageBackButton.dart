import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget rankingPageBackButton(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
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
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    ),
  );
}
