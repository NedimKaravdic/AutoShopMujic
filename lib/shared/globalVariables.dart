import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_admob/firebase_admob.dart';

FirebaseAuth userInstance = FirebaseAuth.instance;
final firestoreInstance = FirebaseFirestore.instance;
User user = FirebaseAuth.instance.currentUser;
final uid = FirebaseAuth.instance.currentUser.uid;
final assetsAudioPlayer = AssetsAudioPlayer();
bool isPaused = false;

final rewardedVideoAd = RewardedVideoAd.instance;

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  testDevices: <String>["7945AFC4E987409495B07AE81632366E"],
  nonPersonalizedAds: false,
);

BuildContext loadingContext;

bool isPremium = false;
bool isinit = true;

String userName = "";
String userID = "";
String photoURL = "";
int highScore;
String lastGameScore;

int extraLives = 0;

bool toddler = false;
bool tourist = false;
bool student = false;
bool citizen = false;
bool patriot = false;

String rank = "";

Map<String, dynamic> unlockedRanks = {
  "Toddler": toddler,
  "Tourist": tourist,
  "Student": student,
  "Citizen": citizen,
  "Patriot": patriot,
};

SharedPreferences prefs;
Future<SharedPreferences> checkRank() async {
  prefs = await SharedPreferences.getInstance();
  return prefs;
}
