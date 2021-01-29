import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget awardsContainer(BuildContext context) {
  return Container(
      width: SizeConfig.blockSizeHorizontal * 15,
      height: SizeConfig.blockSizeVertical * 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(width: 4, color: Colors.black),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ));
}
