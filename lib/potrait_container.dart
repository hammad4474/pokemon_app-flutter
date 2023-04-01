import 'package:flutter/material.dart';

import 'const/heading.dart';
import 'const/poke_type_container.dart';

Widget potraitContainer(data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headingText(name: data['name'].toString(), color: Colors.white, size: 30),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          pokeContainer(
              name: data['category'].toString(), size: 16, color: Colors.white),
          SizedBox(
            width: 6,
          ),
          pokeContainer(
              name: data['abilities'].toString(),
              size: 16,
              color: Colors.white),
        ],
      ),
      SizedBox(
        height: 50,
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/pokeball.png',
              color: Colors.white.withOpacity(0.50),
              width: 180,
            ),
            Image.network(
              data['imageurl'],
              width: 150,
            ),
          ],
        ),
      ),
    ],
  );
}
