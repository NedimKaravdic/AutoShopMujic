import 'package:Quiz_App/screens/awardScreen/widgets/AwardsContainer.dart';
import 'package:Quiz_App/screens/awardScreen/widgets/AwardsList.dart';
import 'package:Quiz_App/screens/certificateShowModal.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/globalVariables.dart';

import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RewardScreen extends StatefulWidget {
  static const String routeName = "/AwardsScreen";
  @override
  _RewardScrenState createState() => _RewardScrenState();
}

List<Map<String, dynamic>> achievements = [
  {
    'title': ['Toddler', '10 questions answered correctly.'],
  },
  {
    'title': ['Tourist', "20 questions answered correctly."]
  },
  {
    'title': ["Student", "30 questions answered correctly."]
  },
  {
    'title': ['Citizen', "40 questions answered correclty."]
  },
  {
    'title': ['Patriot', "All questions answered correctly."]
  },
];

class _RewardScrenState extends State<RewardScreen> {
  initCheck() async {
    prefs = await checkRank();

    return prefs;
  }

  @override
  void initState() {
    super.initState();
    initCheck();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    initCheck();

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
                  padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeHorizontal * 2,
                      left: SizeConfig.blockSizeHorizontal * 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[awardsContainer(context)],
                  ),
                ),
                SizedBox(
                    //height: 15,
                    height: SizeConfig.blockSizeVertical * 2
                    //constraint.maxHeight * 0.022,
                    ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                  child: Container(
                    width: double.infinity,
                    //height: 600,
                    height: SizeConfig.safeBlockVertical * 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.6)),
                    child: Container(
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: SizeConfig.blockSizeHorizontal * 8,
                            ),
                            Text(
                              "Ranks",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 5,
                            ),
                            Expanded(
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: achievements.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height:
                                            SizeConfig.blockSizeHorizontal * 20,
                                        child: Card(
                                          color: Colors.white.withOpacity(0.9),
                                          child: prefs.getBool(
                                                      achievements[index]
                                                          ['title'][0]) ==
                                                  true
                                              ? ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.green[400],
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    achievements[index]['title']
                                                        [1],
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .blockSizeHorizontal *
                                                            4,
                                                        fontFamily:
                                                            "volkswagen-serial",
                                                        color: Colors.black),
                                                  ),
                                                  title: Text(
                                                    achievements[index]['title']
                                                        [0],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeConfig
                                                                .blockSizeHorizontal *
                                                            8,
                                                        fontFamily: "Digitalt",
                                                        shadows: sharedShadows),
                                                  ),
                                                )
                                              : ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey[400],
                                                    child: Icon(
                                                      Icons.lock,
                                                      color: Colors.blue[900],
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    achievements[index]['title']
                                                        [1],
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .blockSizeHorizontal *
                                                            4,
                                                        fontFamily:
                                                            "volkswagen-serial",
                                                        color: Colors.black),
                                                  ),
                                                  title: Text(
                                                    achievements[index]['title']
                                                        [0],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: SizeConfig
                                                                .blockSizeHorizontal *
                                                            8,
                                                        fontFamily: "Digitalt",
                                                        shadows: sharedShadows),
                                                  ),
                                                ),
                                        ),
                                      );
                                    })),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.blockSizeHorizontal * 4),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Get Certificate",
                                  style: TextStyle(
                                      fontFamily: "volkswagen-serial",
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 4,
                                      color: Colors.black),
                                ),
                                onPressed: () {
                                  if (rank == "Patriot") {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.blue[900],
                                      content: Text(
                                          "Unlock Patriot Rank In Order To Get Certificate."),
                                    ));
                                  } else {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return showModalCertificate();
                                        });
                                  }
                                },
                              ),
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
