import 'package:shared_preferences/shared_preferences.dart';

Future<String> getLastGameScore(String lastGameScoretxt) async {
  final prefs = await SharedPreferences.getInstance();
  final lastGameScore = prefs.getString("last_game_score");

  lastGameScoretxt = lastGameScore;

  if (lastGameScore == null) {
    lastGameScoretxt = "0";

    return lastGameScoretxt;
  } else {
    return lastGameScoretxt;
  }
}
