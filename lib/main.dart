import 'package:Quiz_App/models/USstates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/PlayScreen.dart';
import 'screens/MainMenu.dart';
import 'package:Quiz_App/screens/AwardsScreen.dart';
import 'screens/GameModeScreen.dart';
import 'package:Quiz_App/models/AchievementChecker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(QuizzApp());
}

class QuizzApp extends StatefulWidget {
  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: StatesList()),
          ChangeNotifierProvider.value(value: Achievements()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
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
                fontFamily: 'Nisebuschgardens'),
            headline2: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
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
                fontFamily: 'Nisebuschgardens'),
            headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
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
                fontFamily: 'Nisebuschgardens'),
            headline6: TextStyle(
                fontFamily: 'volkswagen-serial',
                fontWeight: FontWeight.bold,
                fontSize: 20),
            headline4: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'KronaOne'),
            headline5: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
                fontFamily: 'KronaOne'),
          )),
          debugShowCheckedModeBanner: false,
          home: MainMenu(),
          routes: {
            // PlayScreen.routeName: (context) => PlayScreen(),
            RewardScreen.routeName: (context) => RewardScreen(),
            GameModeScreen.routeName: (context) => GameModeScreen(),
          },
        ));
  }
}
