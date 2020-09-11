import 'package:flutter/material.dart';
import 'package:AutoShopMujic/screens/SearchScreen.dart';
import 'package:AutoShopMujic/screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:AutoShopMujic/screens/AddItemScreen.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isLoggedin = false;

  User user;
  String uId;

  Widget buildCard(Icon icon, String text, Function func) {
    return GestureDetector(
      onTap: func,
      child: Card(
        elevation: 20,
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("user nula");
    } else {
      setState(() {
        isLoggedin = true;
        uId = user.uid;
      });
    }

    return Drawer(
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Image.asset("images/audi.jpg",
                      color: Color(0xff990000),
                      fit: BoxFit.fill,
                      colorBlendMode: BlendMode.multiply),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 38),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Center(
                            child: Text(
                          "Auto Shop",
                          style: TextStyle(
                              fontFamily: "BigNoodle",
                              fontSize: 50,
                              color: Colors.white),
                        )),
                        SizedBox(
                          height: 0,
                        ),
                        Center(
                            child: Text("Mujic",
                                style: TextStyle(
                                    fontFamily: "BigNoodle",
                                    fontSize: 40,
                                    color: Colors.white))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            buildCard(
                Icon(
                  Icons.search,
                  color: Color(0xff990000),
                  size: 30,
                ),
                "Pretraga", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            }),
            SizedBox(
              height: 2,
            ),
            buildCard(
                Icon(
                  Icons.person_outline,
                  color: Color(0xff990000),
                  size: 30,
                ),
                "O Nama",
                () {}),
            SizedBox(
              height: 2,
            ),
            buildCard(
                Icon(
                  Icons.contact_phone,
                  color: Color(0xff990000),
                  size: 30,
                ),
                "Kontakt",
                () {}),
            SizedBox(
              height: 2,
            ),
            if (uId == "OUTJtnFjhVWmZF3nZWT8WaGbUDf2")
              buildCard(
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Color(0xff990000),
                  ),
                  "Dodjate Artikle",
                  () =>
                      Navigator.of(context).pushNamed(AddItemScreen.routeName)),
            isLoggedin == false
                ? buildCard(
                    Icon(
                      Icons.people_outline,
                      color: Color(0xff990000),
                      size: 30,
                    ),
                    "Prijavite se",
                    () => Navigator.of(context)
                            .pushNamed(LoginScreen.routeName)
                            .then((value) {
                          setState(() {});
                        }))
                : buildCard(
                    Icon(
                      Icons.exit_to_app,
                      size: 30,
                      color: Color(0xff990000),
                    ),
                    "Odjavite se ", () async {
                    await FirebaseAuth.instance.signOut();
                    isLoggedin = false;
                    Navigator.of(context).pop();
                  }),
          ],
        ),
      ),
    );
  }
}
