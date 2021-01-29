import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/shadows.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';

Widget topRankingList(
    ScrollController controller, AsyncSnapshot<dynamic> snapshot) {
  return ListView.builder(
    shrinkWrap: true,
    controller: controller,
    itemCount: 10,
    scrollDirection: Axis.vertical,
    physics: AlwaysScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return topRankingItem(index, snapshot);
    },
  );
}

Widget topRankingItem(int index, AsyncSnapshot<dynamic> snapshot) {
  int i = index + 1;
  return ListTile(
    leading: Container(
      child: CircleAvatar(
        radius: 22,
        backgroundColor:
            snapshot.data.documents[index].data()["isPremiumUser"] == true
                ? Color(0xffFFA500)
                : Colors.blue[900],
        child: Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(
                  snapshot.data.documents[index].data()["photoUrl"]),
            ),
          ],
        ),
      ),
    ),
    title: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$i".toString() + "#" + " ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: i == 1
                  ? Colors.amberAccent
                  : i == 2
                      ? Color(0xffc0c0c0)
                      : i == 3
                          ? Color(0xffCD7F32)
                          : Colors.white,
              fontFamily: "volkswagen-serial",
              fontSize: SizeConfig.blockSizeHorizontal * 4,
              shadows: nameShadows)),
      TextSpan(
        
        text: snapshot.data.documents[index].data()["userName"],
        style: TextStyle(
            fontFamily: "Digitalt",
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: SizeConfig.blockSizeHorizontal * 5,
            shadows: nameShadows),
      ),
    ])),
    subtitle: Text(
      snapshot.data.documents[index].data()["isPremiumUser"]
          ? snapshot.data.documents[index].data()["userRank"] +
              " " +
              "|" +
              " " +
              "Premium User 💎"
          : snapshot.data.documents[index].data()["userRank"],
      style: TextStyle(
        fontFamily: "volkswagen-serial",
        color: Colors.black.withOpacity(0.8),
      ),
    ),
    trailing: Text(
      snapshot.data.documents[index].data()["highScore"].toString(),
      style: TextStyle(
          color: Colors.white,
          fontFamily: "Digitalt",
          shadows: nameShadows,
          letterSpacing: 2.0,
          fontSize: SizeConfig.blockSizeHorizontal * 5),
    ),
  );
}
