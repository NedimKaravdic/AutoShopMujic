import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CircularTimer extends StatefulWidget {
  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularCountDownTimer(
          duration: 5,
          fillColor: Colors.orangeAccent,
          color: Colors.white,
          isReverse: true,
          width: SizeConfig.blockSizeHorizontal * 55,
          height: SizeConfig.blockSizeHorizontal * 28,
          textStyle: TextStyle(
              color: Colors.amberAccent,
              shadows: nameShadows,
              fontSize: SizeConfig.blockSizeHorizontal * 7,
              fontWeight: FontWeight.bold),
          onComplete: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
