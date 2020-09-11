import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:AutoShopMujic/screens/Automobili_Pretraga.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

Widget buildBtn(String title, Function func, Icon icon) {
  return SizedBox(
    height: 60,
    width: 300,
    child: FlatButton.icon(
        onPressed: func,
        icon: icon,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(color: Colors.white, width: 2)),
        color: Colors.transparent,
        label: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        )),
  );
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "images/autoshop.jpg",
              ),
              colorFilter:
                  ColorFilter.mode(Color(0xff990000), BlendMode.multiply),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 50,
                    margin: EdgeInsets.all(15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 3, color: Colors.white)),
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 105,
                      ),
                      Text(
                        "Ja Trazim ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Bignoodle",
                            fontSize: 70),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      buildBtn("Automobile", () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AutomobiliPretraga();
                        }));
                      },
                          Icon(
                            Icons.directions_car,
                            size: 35,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 35,
                      ),
                      buildBtn(
                          "Autodijelove",
                          () {},
                          Icon(
                            Icons.build,
                            size: 30,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
