import 'package:shared_preferences/shared_preferences.dart';

Future<int> getHighScore(int prf) async {
  final prefs = await SharedPreferences.getInstance();
  final highScore = prefs.getInt("high_score");

  prf = highScore;

  if (highScore == null) {
    prf = 0;

    prefs.setInt("high_score", prf);
    print(prf);

    return prf;
  } else {
    prf = highScore;

    print(prf);
    return prf;
  }
}
