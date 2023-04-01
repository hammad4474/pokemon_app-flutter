import 'package:flutter/material.dart';

import 'heading.dart';

Widget stateRow({String? name, String? value}) {
  var health = int.parse(value.toString());
  return Row(
    children: [
      SizedBox(
        width: 100,
        child: headingText(name: name, color: Colors.grey, size: 16),
      ),
      SizedBox(
        width: 100,
        child: headingText(name: value, color: Colors.black, size: 16),
      ),
      Container(
        height: 2,
        width: health.toDouble(),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ],
  );
}
