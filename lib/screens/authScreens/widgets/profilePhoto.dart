import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget profilePhoto() {
  return StreamBuilder(
    stream: firestoreInstance.collection("users").doc(uid).snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(
          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
          child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 28,
                backgroundColor:
                    isPremium == true ? Color(0xffFFA500) : Colors.blue[900],
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: CachedNetworkImageProvider(
                      snapshot.data.data()["photoUrl"]),
                ),
              )),
        );
      } else {
        return SpinKitDualRing(
          color: Colors.blue[900],
        );
      }
    },
  );
}
