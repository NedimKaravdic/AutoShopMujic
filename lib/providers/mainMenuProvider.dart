import 'package:Quiz_App/screens/awardScreen/pages/AwardsScreen.dart';
import 'package:Quiz_App/screens/GameModeScreen.dart';
import 'package:Quiz_App/services/mainMenuServices/getHighScore.dart';
import 'package:Quiz_App/services/mainMenuServices/getLastGameScore.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuProvider with ChangeNotifier {
  int prf;
  String lastGameScoretxt;

  Future<void> getResult() async {
    if (highScore == null) {
      highScore = await getHighScore(prf);
      lastGameScore = await getLastGameScore(lastGameScoretxt);
      notifyListeners();
    }
  }

  void goToScreen(String screenName, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Navigator.of(context).pushNamed(routeName);
    if (screenName == "GameModeScreen") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return GameModeScreen();
      })).then((value) {
        highScore = prefs.getInt("high_score");
        lastGameScore = prefs.getString("last_game_score");
        notifyListeners();
      });
    } else if (screenName == "AwardsScreen") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return RewardScreen();
        },
      )).then((value) {
        notifyListeners();
      });
    }
  }
}
