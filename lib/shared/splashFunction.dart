import 'package:shared_preferences/shared_preferences.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/checkConnectivity.dart';

void checkScores() async {
  final pref = await SharedPreferences.getInstance();
  if (pref.getInt("high_score") == null) {
    pref.setInt("high_score", 0);
    highScore = pref.getInt("high_score");
  } else {
    highScore = pref.getInt("high_score");
  }

  if (pref.getString("last_game_score") == null) {
    pref.setString("last_game_score", "0");
    lastGameScore = pref.getString("last_game_score");
  } else {
    lastGameScore = pref.getString("last_game_score");
  }

  if (pref.getString("userName") == null) {
    pref.setString("userName", "");
    userName = pref.getString("userName");
  } else {
    userName = pref.getString("userName");
  }
  if (pref.getString("uid") == null) {
    pref.setString("uid", "");
    userID = pref.getString("uid");
  } else {
    userID = pref.getString("uid");
  }
  if (pref.getString("photoURL") == null) {
    pref.setString("photoURL", "");
    photoURL = pref.getString("photoURL");
  } else {
    photoURL = pref.getString("photoURL");
  }

  if (pref.getString("userRank") == null) {
    pref.setString("userRank", "No Rank");
    rank = pref.getString("userRank");
  } else {
    rank = pref.getString("userRank");
  }

  if (pref.getBool("isPremium") == null) {
    pref.setBool("isPremium", false);
    isPremium = pref.getBool("isPremium");
  } else {
    isPremium = pref.getBool("isPremium");
  }

  if (pref.getInt("extraLives") == null) {
    pref.setInt("extraLives", 0);
    extraLives = pref.getInt("extraLives");
  } else {
    extraLives = pref.getInt("extraLives");
  }

  print(highScore);
  print(lastGameScore);
}

void checkBools(bool rank, String rankName) async {
  final pref = await SharedPreferences.getInstance();
  if (pref.getBool(rankName) == null) {
    pref.setBool(rankName, false);
    rank = pref.getBool(rankName);
  } else {
    rank = pref.getBool(rankName);
  }
  print(rank);
}

void splashBools() {
  checkBools(toddler, "Toddler");
  checkBools(tourist, "Tourist");
  checkBools(student, "Student");
  checkBools(citizen, "Citizen");
  checkBools(patriot, "Patriot");
}

void firebaseToPrefs() async {
  if (userInstance.currentUser != null && await checkConnectivity() == false) {
    final document =
        await firestoreInstance.collection("users").doc(user.uid).get();
    userID = document.data()["uid"];
    userName = document.data()["userName"];
    highScore = document.data()["highScore"];
    lastGameScore = document.data()["lastGameScore"];
    photoURL = document.data()["photoURL"];
    rank = document.data()["userRank"];
    unlockedRanks = document.data()["unlockedRanks"];

    print(userID);
    print(userName);
    print(highScore);
    print(lastGameScore);
    print(photoURL);
    print(rank);
    print(unlockedRanks);
  }
}
