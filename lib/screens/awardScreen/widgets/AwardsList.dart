import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget awardsList(BuildContext context, SharedPreferences prefs,
    List achievements, int index) {
  Container(
    height: SizeConfig.blockSizeHorizontal * 20,
    child: Card(
      color: Colors.white.withOpacity(0.9),
      child: prefs.getBool(achievements[index]['title'][0]) == true
          ? ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[400],
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                achievements[index]['title'][1],
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontFamily: "volkswagen-serial",
                    color: Colors.black),
              ),
              title: Text(
                achievements[index]['title'][0],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockSizeHorizontal * 8,
                    fontFamily: "Digitalt",
                    shadows: sharedShadows),
              ),
            )
          : ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[400],
                child: Icon(
                  Icons.lock,
                  color: Colors.blue[900],
                ),
              ),
              subtitle: Text(
                achievements[index]['title'][1],
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontFamily: "volkswagen-serial",
                    color: Colors.black),
              ),
              title: Text(
                achievements[index]['title'][0],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockSizeHorizontal * 8,
                    fontFamily: "Digitalt",
                    shadows: sharedShadows),
              ),
            ),
    ),
  );
}
