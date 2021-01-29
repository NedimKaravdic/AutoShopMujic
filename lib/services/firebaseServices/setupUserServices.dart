import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/splashFunction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> setupUserServices() async {
  var newHighScore = highScore;
  final document = await firestoreInstance.collection("users").doc(uid).get();
  if (!document.exists) {
    await firestoreInstance
        .collection("users")
        .doc(userInstance.currentUser.uid)
        .set({
      'userName': userInstance.currentUser.displayName,
      'photoUrl': userInstance.currentUser.photoURL,
      "highScore": newHighScore,
      "lastGameScore": lastGameScore,
      "userRank": rank,
      "unlockedRanks": unlockedRanks,
      "isPremiumUser": false,
      "extraLives": 0,
      "uid": userInstance.currentUser.uid
    });
    final userResult = await firestoreInstance
        .collection("users")
        .doc(userInstance.currentUser.uid)
        .get();
    userName = userInstance.currentUser.displayName;
    prefs.setString("userName", userName);
    photoURL = userResult.data()["photoUrl"];
    prefs.setString("photoURL", photoURL);
    userID = userInstance.currentUser.uid;
    prefs.setString("uid", userID);
    prefs.setBool("isPremium", false);
    isPremium = prefs.getBool("isPremium");
  } else {
    final userResult = await firestoreInstance
        .collection("users")
        .doc(userInstance.currentUser.uid)
        .get();
    userName = userInstance.currentUser.displayName;
    prefs.setString("userName", userName);
    photoURL = userResult.data()["photoUrl"];
    prefs.setString("photoURL", photoURL);
    userID = userInstance.currentUser.uid;
    prefs.setString("uid", userID);
    highScore = userResult.data()["highScore"];
    prefs.setInt("highScore", highScore);
    lastGameScore = userResult.data()["lastGameScore"];
    prefs.setString("last_game_score", lastGameScore);
    rank = userResult.data()["userRank"];
    prefs.setString("userRank", rank);
    unlockedRanks = userResult.data()["unlockedRanks"];

    unlockedRanks.forEach((key, value) {
      switch (key) {
        case "Toddler":
          toddler = value;
          prefs.setBool("Toddler", value);
          break;
        case "Tourist":
          tourist = value;
          prefs.setBool("Tourist", value);
          break;
        case "Student":
          student = value;
          prefs.setBool("Student", value);
          break;
        case "Patriot":
          patriot = value;
          prefs.setBool("Patriot", value);
          break;
        case "Citizen":
          citizen = value;
          prefs.setBool("Citizen", value);
          break;
      }
    });

    /*firestoreInstance
        .collection("users")
        .doc(userInstance.currentUser.uid)
        .update({
      "highScore": highScore,
      "lastGameScore": lastGameScore,
      "rank": rank,
      "unlockedRanks": unlockedRanks,
    });
    */

    isPremium = userResult.data()["isPremiumUser"];
    extraLives = userResult.data()["extraLives"];
  }
}
