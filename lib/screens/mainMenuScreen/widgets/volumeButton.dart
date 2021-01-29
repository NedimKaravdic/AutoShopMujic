import 'package:Quiz_App/shared/globalVariables.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

Widget volumeButton(BuildContext context, Function function) {
  return Align(
    alignment: Alignment.topLeft,
    child: StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isPaused = !isPaused;
              assetsAudioPlayer.playOrPause();
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 3),
            width: SizeConfig.blockSizeHorizontal * 15,
            height: SizeConfig.blockSizeVertical * 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[900].withOpacity(0.8),
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: Center(
              child: Icon(
                isPaused ? Icons.volume_off : Icons.volume_up,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    ),
  );
}
