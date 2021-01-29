import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class HealthStatus extends StatefulWidget {
  final int health;
  final int seconds;
  int screenScore;
  Function function;
  HealthStatus(
      {@required this.health,
      @required this.seconds,
      @required this.screenScore,
      @required this.function});
  @override
  _HealthStatusState createState() => _HealthStatusState();
}

class _HealthStatusState extends State<HealthStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 2),
      height: SizeConfig.blockSizeVertical * 9,
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                widget.function();
                Navigator.of(context).pop();
              },
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 19,
                //height: SizeConfig.blockSizeVertical * 9,
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    size: 35,
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(width: 4)),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 2),
              width: SizeConfig.blockSizeHorizontal * 19,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.screenScore.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockSizeHorizontal * 8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        widget.health <= 0
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red,
                      ),
                      Icon(
                        widget.health <= 1
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red,
                      ),
                      Icon(
                        widget.health <= 2
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(width: 4)),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 1,
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 19,
            //  height: SizeConfig.blockSizeVertical * 9,
            child: Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  widget.seconds.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  width: 4,
                )),
          ),
        ],
      ),
    );
  }
}
