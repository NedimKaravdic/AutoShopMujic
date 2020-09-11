import 'package:flutter/material.dart';
import 'package:Quiz_App/models/CustomTimerPainter.dart';

class ExtraLifeScreen extends StatefulWidget {
  bool isCancelable;
  ExtraLifeScreen({@required this.isCancelable});
  @override
  _ExtraLifeScreenState createState() => _ExtraLifeScreenState();
}

class _ExtraLifeScreenState extends State<ExtraLifeScreen> {
  void popFunction(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 350,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Watch Ad For Extra Life ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Digitalt",
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(child: CircularTimer()),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 10,
                    color: Colors.red,
                    child: Text(
                      "NO",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Digitalt",
                        fontSize: 20,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.black),
                        ],
                      ),
                    ),
                    onPressed: () {
                      popFunction(context);
                      widget.isCancelable = true;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    elevation: 10,
                    color: Colors.green,
                    child: Text(
                      "YES",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Digitalt",
                        fontSize: 20,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.black),
                        ],
                      ),
                    ),
                    onPressed: () {
                      print("g0v");
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
