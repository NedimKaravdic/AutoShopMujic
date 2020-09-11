import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 7,
      decoration: BoxDecoration(
          color: Color(0xff990000), borderRadius: BorderRadius.circular(10)),
    );
  }
}
