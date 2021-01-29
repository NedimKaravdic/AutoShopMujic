import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:flutter/material.dart';

void updateRankFunction(String rank) {
  print("AAAAAAAAAAAAAAAAAAAAAAAAAA");
  switch (rank) {
    case "Toddler":
      updatechosenRank(toddler, rank);
      break;
    case "Tourist":
      updatechosenRank(toddler, rank);
      break;
    case "Student":
      updatechosenRank(toddler, rank);
      break;
    case "Citizen":
      updatechosenRank(toddler, rank);
      break;
    case "Patriot":
      updatechosenRank(toddler, rank);
      break;
  }
  unlockedRanks.update(rank, (value) => true);
}

void updatechosenRank(bool rankName, String thisRank) {
  rankName = true;
  rank = thisRank;
  prefs.setString("userRank", thisRank);
  prefs.setBool(thisRank, rankName);
  try {
    firestoreInstance.collection("users").doc(userID).update({
      "userRank": thisRank,
      "unlockedRanks": unlockedRanks,
    });
  } catch (e) {
    print("Possible internet problems");
  }
}
