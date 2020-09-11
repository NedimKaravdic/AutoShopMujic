import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Achievements with ChangeNotifier {
  static bool toddler;
  static bool tourist;
  static bool student = true;
  static bool citizen;
  static bool patriot;

  Map<String, bool> achievements = {
    'Toddler': toddler,
    'Tourist': tourist,
    "Student": student,
    "Citizen": citizen,
    'Patriot': patriot,
  };

  void checkforAchievement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    achievements.forEach((key, value) {
      if (value == null) {
        value = false;
      }
      final achi = prefs.getBool(key);
      if (achi == null) {
        prefs.setBool(key, value);
        final ib = prefs.getBool(key);
        print(ib);
      } else {
        final ib = prefs.getBool(key);

        print(ib);
      }
    });
  }

  bool returnTrue() {
    achievements.forEach((key, value) {
      if (value == true) {
        print(key);
        return value;
      }
    });
  }

  List<String> trues = [];

  String returnKey() {
    achievements.forEach((key, value) {
      if (value == true) {
        trues.add(key);
        return key;
      }
    });
  }
}
