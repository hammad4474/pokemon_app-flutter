import 'package:flutter/material.dart';
import 'package:pokemon_app/const/heading.dart';

Widget pokeContainer({String? name, Color? color, double? size}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white.withOpacity(0.30),
    ),
    child: normalText(name: name, color: color, size: size),
  );
}
