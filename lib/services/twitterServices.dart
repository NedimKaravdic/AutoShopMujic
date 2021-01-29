import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:Quiz_App/shared/globalVariables.dart';

Future<UserCredential> signInWithTwitter() async {
  // Create a TwitterLogin instance
  final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: '5amchIgHwalw90nzyPkHLI8nW',
    consumerSecret: '096taDD2k9RvoMIBlXEzLz8csfbbrp3Wqb2i8wVuvguKupFoOo',
  );

  // Trigger the sign-in flow
  final TwitterLoginResult loginResult = await twitterLogin.authorize();

  // Get the Logged In session
  final TwitterSession twitterSession = loginResult.session;
  Navigator.of(loadingContext).pop();
  // Create a credential from the access token
  final AuthCredential twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: twitterSession.token, secret: twitterSession.secret);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance
      .signInWithCredential(twitterAuthCredential);
}
