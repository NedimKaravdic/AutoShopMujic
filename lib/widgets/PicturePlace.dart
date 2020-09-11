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
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: double.infinity,
            //height: 200,
            height: constraints.maxWidth * 0.51,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
