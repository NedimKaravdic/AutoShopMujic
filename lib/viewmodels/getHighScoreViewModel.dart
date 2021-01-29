import 'package:Quiz_App/services/mainMenuServices/getHighScore.dart';

Future getHighScoreViewModel(String prf) async {
  getHighScore(int.parse(prf));
}
