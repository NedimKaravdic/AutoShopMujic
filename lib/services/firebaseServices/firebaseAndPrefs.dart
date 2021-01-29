import 'package:Quiz_App/services/mainMenuServices/getHighScore.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:flutter/material.dart';

Future<void> firebaseAndPrefs() async {
  try {
    final userDoc = await firestoreInstance
        .collection("users")
        .doc(userInstance.currentUser.uid)
        .get();

    final firebaseScore = userDoc.data()["highScore"];
    final firebaseLastGame = userDoc.data()["lastGameScore"];
    extraLives = userDoc.data()["extraLives"];
    isPremium = userDoc.data()["isPremiumUser"];
    prefs.setBool("isPremium", isPremium);
    print(extraLives.toString() + "johuuhhausfhasof");

    highScore = firebaseScore;
    lastGameScore = firebaseLastGame;

    final highScoreInt = firebaseScore;
    final lastGameInt = int.parse(lastGameScore);

    prefs.setInt("high_score", firebaseScore);
    prefs.setString("last_game_score", lastGameScore);

    if (highScore > highScoreInt) {
      await firestoreInstance
          .collection("users")
          .doc(userInstance.currentUser.uid)
          .update({
        "highScore": highScore,
        "lastGameScore": lastGameScore,
      });
    } else {
      highScore = firebaseScore;
      lastGameScore = firebaseLastGame;
    }
    if (firebaseLastGame != lastGameScore) {
      await firestoreInstance
          .collection("users")
          .doc(userInstance.currentUser.uid)
          .update({
        "lastGameScore": lastGameScore,
      });
    } else {
      lastGameScore = firebaseLastGame;
    }
  } catch (e) {
    print(e);
  }
}
