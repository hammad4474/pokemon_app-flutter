import 'package:flutter/material.dart';

import 'heading.dart';

Widget rowStyling({String? name, String? value}) {
  return Row(
    children: [
      SizedBox(
          width: 100,
          child: headingText(name: name, size: 16, color: Colors.grey)),
      headingText(name: value, size: 16, color: Colors.grey),
    ],
  );
}
