import 'package:Quiz_App/providers/mainMenuProvider.dart';
import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainMenuText.dart';

Widget scoreBox(BuildContext context) {
  final prov = Provider.of<MainMenuProvider>(context);
  return Column(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 0.5,
          ),
          child: scoreText(
              context,
              "High Score:",
              SizeConfig.blockSizeHorizontal * 5.5,
              "Digitalt",
              Colors.black.withOpacity(0.8))),
      Text(
        highScore == null ? "0" : highScore.toString(),
        style: Theme.of(context).textTheme.headline5,
      ),
      scoreText(
          context,
          "Last Game Score:",
          SizeConfig.blockSizeHorizontal * 5.5,
          "Digitalt",
          Colors.black.withOpacity(0.8)),
      Text(
        lastGameScore == null ? "0" : lastGameScore,
        style: Theme.of(context).textTheme.headline5,
      ),
    ],
  );
}
