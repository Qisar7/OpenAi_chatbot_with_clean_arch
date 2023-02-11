import 'package:flutter/material.dart';

class Mycolor {
  static const mblack = Colors.black;
  static const mwhite = Colors.white;
  static const mgrey = Colors.grey;
  static const darkColor = Color.fromRGBO(48, 48, 48, 1);

  static List<BoxShadow> glowBoxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(.4),
      blurRadius: 6.0,
      spreadRadius: 3.0,
      offset: const Offset(
        0.0,
        3.0,
      ),
    ),
  ];
}
