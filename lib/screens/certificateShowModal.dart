import 'package:Quiz_App/shared/shadows.dart';
import 'package:Quiz_App/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

Widget certifiateShowModal() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage("images/confettiTexture.png"))),
    height: SizeConfig.blockSizeVertical * 25,
    width: SizeConfig.blockSizeHorizontal * 90,
    child: Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Text(
          "Certificate of Achievement",
          style: TextStyle(
              color: Colors.red[400],
              fontWeight: FontWeight.bold,
              fontFamily: "Certificate",
              fontSize: SizeConfig.blockSizeHorizontal * 7),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 0.5,
        ),
        Text(
          "Awarded to",
          style: TextStyle(
              color: Colors.red[400],
              fontFamily: "Certificate",
              fontSize: SizeConfig.blockSizeHorizontal * 5),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1,
        ),
        Text(
          "Name and Surname",
          style: TextStyle(fontFamily: "Nisebuschgardens"),
        ),
        Divider(
          height: SizeConfig.blockSizeVertical * 2,
          indent: SizeConfig.blockSizeHorizontal * 18,
          endIndent: SizeConfig.blockSizeHorizontal * 18,
          color: Colors.black,
        ),
        Text(
          "For successfully completing US Capitals Quiz",
          style: TextStyle(
              fontFamily: "volkswagen-serial",
              fontSize: SizeConfig.blockSizeHorizontal * 3),
        ),
        Text(
          "Global Challenge",
          style: TextStyle(
              fontFamily: "volkswagen-serial",
              fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 4),
          child: Row(
            children: [
              Column(
                children: [
                  Text("Today"),
                  Divider(
                    indent: SizeConfig.blockSizeHorizontal * 5,
                    endIndent: SizeConfig.blockSizeHorizontal * 5,
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget showModalCertificate() {
  return Container(
    decoration: BoxDecoration(color: Colors.blue[900]),
    height: SizeConfig.blockSizeVertical * 80,
    width: double.infinity,
    child: Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Text(
          "CERTIFICATE",
          style: TextStyle(
              color: Colors.amberAccent,
              fontFamily: "ShinySignature",
              shadows: nameShadows,
              fontSize: SizeConfig.blockSizeHorizontal * 6),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        certifiateShowModal(),
      ],
    ),
  );
}
