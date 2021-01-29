import 'package:flutter/material.dart';

int calculateRank(String rank, int score) {
  int newScore = 0;
  switch (rank) {
    case "No Rank":
      newScore = score;
      break;
    case "Toddler":
      var percentage = (5 / 100) * 100;
      newScore += percentage.toInt();
      break;
    case "Tourist":
      var percentage = (5 / 100) * 100;
      newScore += percentage.toInt();
      break;
    case "Student":
      var percentage = (5 / 100) * 100;
      newScore += percentage.toInt();
      break;
    case "Citizen":
      var percentage = (5 / 100) * 100;
      newScore += percentage.toInt();
      break;
    case "Patriot":
      var percentage = (5 / 100) * 100;
      newScore += percentage.toInt();
      break;
  }
  // int newVar = int.parse(newScore);
  return newScore; //return newVar;
}
