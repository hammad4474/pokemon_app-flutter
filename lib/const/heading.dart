// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget headingText({
  String? name,
  Color? color,
  double? size,
}) {
  return Text(
    name!,
    style: TextStyle(
        fontFamily: 'circula',
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color),
  );
}

Widget normalText({String? name, Color? color, double? size}) {
  return Text(
    name!,
    style: TextStyle(
        fontFamily: 'circula',
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color),
  );
}

