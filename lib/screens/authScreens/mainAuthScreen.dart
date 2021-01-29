import 'package:Quiz_App/screens/authScreens/pages/authPages.dart';
import 'package:Quiz_App/screens/authScreens/pages/rankingPage.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MainAuthScreen extends StatefulWidget {
  static const routeName = "/mainAuthScreen";

  @override
  _MainAuthScreenState createState() => _MainAuthScreenState();
}

class _MainAuthScreenState extends State<MainAuthScreen> {
  String isLogged = "";
  @override
  void initState() {
    if (userInstance.currentUser == null) {
      isLogged = "false";
    } else {
      isLogged = "true";
    }
    userInstance.authStateChanges().listen((User user) {
      if (user == null) {
        isLogged = "false";
      } else {
        isLogged = "true";
      }
    });
    super.initState();
  }

  void rebuildState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/mainMenu.jpg"),
                        fit: BoxFit.cover)),
                child: isLogged == "false"
                    ? authPage(context, rebuildState)
                    : rankingPage(context))));
  }
}
