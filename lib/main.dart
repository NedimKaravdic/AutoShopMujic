import 'dart:io';

import 'package:Quiz_App/models/USstates.dart';
import 'package:Quiz_App/providers/mainMenuProvider.dart';
import 'package:Quiz_App/screens/authScreens/mainAuthScreen.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/splashFunction.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'screens/mainMenuScreen/pages/MainMenu.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:Quiz_App/screens/awardScreen/pages/AwardsScreen.dart';
import 'screens/GameModeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  checkRank();
  checkScores();
  splashBools();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(QuizzApp());
}

class QuizzApp extends StatefulWidget {
  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-8549613552572730~9439202369");
    WidgetsBinding.instance.addObserver(this);
    assetsAudioPlayer.open(Audio("sounds/backgroundMusic.mp3"),
        volume: 0.2, loopMode: LoopMode.single);

    rewardedVideoAd.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print('Rewarded event: $event');
      if (event == RewardedVideoAdEvent.rewarded) {
        extraLives += 1;
        firestoreInstance
            .collection("users")
            .doc(uid)
            .update({"extraLives": extraLives});

        rewardedVideoAd.load(
            adUnitId: 'ca-app-pub-8549613552572730/3184267628',
            targetingInfo: targetingInfo);
      } else if (event == RewardedVideoAdEvent.closed) {
        rewardedVideoAd.load(
            adUnitId: 'ca-app-pub-8549613552572730/3184267628',
            targetingInfo: targetingInfo);
      }
    };
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      assetsAudioPlayer.pause();
    }
    if (state == AppLifecycleState.resumed) {
      if (isPaused != true) {
        assetsAudioPlayer.play();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: StatesList()),
          ChangeNotifierProvider.value(value: MainMenuProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                shadows: sharedShadows,
                fontFamily: 'Nisebuschgardens'),
            headline2: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                shadows: sharedShadows,
                fontFamily: 'Nisebuschgardens'),
            headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
                shadows: sharedShadows,
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
            MainAuthScreen.routeName: (context) => MainAuthScreen(),
          },
        ));
  }
}
