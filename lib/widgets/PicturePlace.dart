import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PicturePlace extends StatefulWidget {
  String image;
  PicturePlace({@required this.image});
  @override
  _PicturePlaceState createState() => _PicturePlaceState();
}

class _PicturePlaceState extends State<PicturePlace> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 4),
          child: Container(
            width: double.infinity,
            //height: 200,4
            height: SizeConfig.blockSizeVertical * 24,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeHorizontal * 5,
                  horizontal: SizeConfig.blockSizeHorizontal * 6),
              child: Image(
                image: AssetImage(
                  widget.image,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
