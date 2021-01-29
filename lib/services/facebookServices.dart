import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';

Future<UserCredential> signInWithFacebook() async {
  final result = await FacebookAuth.instance.login();

  final FacebookAuthCredential credential =
      FacebookAuthProvider.credential(result.token);
  Navigator.of(loadingContext).pop();
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
