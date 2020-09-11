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
          fillColor: Colors.blue,
          color: Colors.white,
          isReverse: true,
          width: 100,
          height: 100,
          textStyle: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          onComplete: () {
            print("Hello");
          },
        ),
      ),
    );
  }
}
