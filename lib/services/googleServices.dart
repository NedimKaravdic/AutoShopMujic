import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

Future<UserCredential> signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow

  /*showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [LinearProgressIndicator()],
        );
      });
  */
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  print("joing");

  // Obtain the auth details from the request
  Navigator.of(loadingContext).pop();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  print("eplikacija");

  // Create a new credential
  print("bong");
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
