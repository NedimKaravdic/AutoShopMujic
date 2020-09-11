import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:Quiz_App/models/AchievementChecker.dart';

class RewardScreen extends StatefulWidget {
  static const String routeName = "/AwardsScreen";
  @override
  _RewardScrenState createState() => _RewardScrenState();
}

bool check(BuildContext context, String indx) {
  Provider.of<Achievements>(context).returnKey();
  final trues = Provider.of<Achievements>(context).trues;
  if (trues.contains(indx)) {
    print("jO");
    return true;
  }
}

List<Map<String, dynamic>> achievements = [
  {
    'title': ['Toddler', '10 questions answered correctly'],
  },
  {
    'title': ['Tourist', "20 questions answered correctly"]
  },
  {
    'title': ["Student", "30 questions answered correctly"]
  },
  {
    'title': ['Citizen', "40 questions answered correclty"]
  },
  {
    'title': ['Patriot', "All questions answered correctly"]
  },
];

class _RewardScrenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    var textf = MediaQuery.of(context).textScaleFactor;

    return SafeArea(child: Scaffold(body: LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/rewards.jpg"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: constraint.maxWidth * 0.13,
                        height: constraint.maxHeight * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(width: 4, color: Colors.black),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.keyboard_arrow_left),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  //height: 15,
                  height: constraint.maxHeight * 0.022,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    //height: 600,
                    height: constraint.maxHeight * 0.84,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.6)),
                    child: Container(
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Achievements",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: achievements.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 80,
                                      child: Card(
                                        color: Colors.white.withOpacity(0.9),
                                        child: check(
                                                    context,
                                                    achievements[index]['title']
                                                        [0]) ==
                                                true
                                            ? ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.blue[900],
                                                ),
                                                subtitle: Text(
                                                  achievements[index]['title']
                                                      [1],
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontFamily:
                                                          "volkswagen-serial",
                                                      color: Colors.black),
                                                ),
                                                title: Text(
                                                  achievements[index]['title']
                                                      [0],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 35 * textf,
                                                      fontFamily: "Digitalt",
                                                      shadows: [
                                                        Shadow(
                                                            // bottomLeft
                                                            offset: Offset(
                                                                -1.5, -1.5),
                                                            color:
                                                                Colors.black),
                                                        Shadow(
                                                            // bottomRight
                                                            offset: Offset(
                                                                1.5, -1.5),
                                                            color:
                                                                Colors.black),
                                                        Shadow(
                                                            // topRight
                                                            offset: Offset(
                                                                1.5, 1.5),
                                                            color:
                                                                Colors.black),
                                                        Shadow(
                                                            // topLeft
                                                            offset: Offset(
                                                                -1.5, 1.5),
                                                            color:
                                                                Colors.black),
                                                      ]),
                                                ),
                                              )
                                            : ListTile(
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.blue[900],
                                                ),
                                                subtitle: Text(
                                                  achievements[index]['title']
                                                      [1],
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontFamily:
                                                          "volkswagen-serial",
                                                      color: Colors.black),
                                                ),
                                                title: Text(
                                                  achievements[index]['title']
                                                      [0],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 35 * textf,
                                                      fontFamily: "Digitalt",
                                                      shadows: [
                                                        Shadow(
                                                            // bottomLeft
                                                            offset: Offset(
                                                                -1.5, -1.5),
                                                            color:
                                                                Colors.black),
                                                        Shadow(
                                                            // bottomRight
                                                            offset: Offset(
                                                                1.5, -1.5),
                                                            color:
                                                                Colors.black),
                                                        Shadow(
                                                            // topRight
                                                            offset: Offset(
                                                                1.5, 1.5),
                                                            color:
                                                                Colors.black),
                                                        Shadow(
                                                            // topLeft
                                                            offset: Offset(
                                                                -1.5, 1.5),
                                                            color:
                                                                Colors.black),
                                                      ]),
                                                ),
                                              ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    )));
  }
}
