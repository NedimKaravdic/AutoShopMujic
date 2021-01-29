import 'package:flutter/material.dart';

List<Shadow> sharedShadows = [
  Shadow(
      // bottomLeft
      offset: Offset(-1.5, -1.5),
      color: Colors.black),
  Shadow(
      // bottomRight
      offset: Offset(1.5, -1.5),
      color: Colors.black),
  Shadow(
      // topRight
      offset: Offset(1.5, 1.5),
      color: Colors.black),
  Shadow(
      // topLeft
      offset: Offset(-1.5, 1.5),
      color: Colors.black),
];

List<Shadow> nameShadows = [
  Shadow(
      // bottomLeft
      offset: Offset(-1, -1),
      color: Colors.black),
  Shadow(
      // bottomRight
      offset: Offset(1, -1),
      color: Colors.black),
  Shadow(
      // topRight
      offset: Offset(1, 1),
      color: Colors.black),
  Shadow(
      // topLeft
      offset: Offset(-1, 1),
      color: Colors.black),
];
