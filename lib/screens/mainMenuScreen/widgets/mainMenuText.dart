import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget headerText(BuildContext context, String text, double fontSize,
    String font, Color color) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, fontFamily: font, color: color),
  );
}

Widget scoreText(BuildContext context, String text, double fontSize,
    String font, Color color) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize, fontFamily: font),
  );
}
