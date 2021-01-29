import 'package:Quiz_App/providers/mainMenuProvider.dart';
import 'package:Quiz_App/screens/mainMenuScreen/widgets/mainColumn.dart';
import 'package:Quiz_App/services/firebaseServices/firebaseAndPrefs.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:Quiz_App/shared/splashFunction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Quiz_App/shared/globalVariables.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  notifyListeners() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isinit)
      firebaseAndPrefs().then((value) {
        setState(() {});
      });
    isinit = false;
    SizeConfig().init(context);
    final prov = Provider.of<MainMenuProvider>(context);
    prov.getResult();

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: SizeConfig.screenHeight * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/mainMenu.jpg"), fit: BoxFit.cover)),
          child: mainColumn(context, notifyListeners),
        ),
      ),
    );
  }
}
