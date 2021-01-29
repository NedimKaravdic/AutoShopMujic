import 'package:Quiz_App/screens/authScreens/widgets/socialMediaButton.dart';
import 'package:Quiz_App/services/facebookServices.dart';
import 'package:Quiz_App/services/googleServices.dart';
import 'package:Quiz_App/services/twitterServices.dart';
import 'package:Quiz_App/shared/alertDialogServices.dart';
import 'package:Quiz_App/shared/checkConnectivity.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/services/firebaseServices/setupUserServices.dart';

Widget socialMediaContainer(BuildContext context, function) {
  bool loaderLoading = false;
  return Center(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.7),
          ),
          height: SizeConfig.blockSizeVertical * 60,
          width: SizeConfig.blockSizeHorizontal * 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.blockSizeVertical * 1),
              Text(
                "Log in with",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nisebuschgardens",
                    fontSize: SizeConfig.blockSizeHorizontal * 10),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 5,
              ),
              buildRaisedButton("Facebook", () async {
                if (await checkConnectivity() == true) {
                  loadingCloudsDialog(context, loaderLoading);
                  try {
                    await signInWithFacebook();
                  } catch (e) {
                    Navigator.of(loadingContext).pop();
                  }

                  await setupUserServices();
                  function();
                } else {
                  cloudsDialog(context, true);
                }
              }, Colors.blue[900].withOpacity(0.7), context),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              buildRaisedButton("Google", () async {
                if (await checkConnectivity() == true) {
                  loadingCloudsDialog(context, loaderLoading);
                  await signInWithGoogle(context);
                  await setupUserServices();
                  function();
                } else {
                  cloudsDialog(context, true);
                }
              }, Colors.red[900].withOpacity(0.7), context),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              buildRaisedButton("Twitter", () async {
                if (await checkConnectivity() == true) {
                  loadingCloudsDialog(context, loaderLoading);
                  await signInWithTwitter();
                  await setupUserServices();
                  function();
                } else {
                  cloudsDialog(context, true);
                }
              }, Colors.blue[600].withOpacity(0.7), context),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Text(
                "By logging in You accept Terms and Conditions",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              Text(
                "Read Terms and Conditions Here",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold),
              ),
            ],
          )));
}
