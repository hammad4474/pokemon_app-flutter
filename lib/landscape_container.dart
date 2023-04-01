import 'package:flutter/material.dart';

import 'const/heading.dart';
import 'const/poke_type_container.dart';

Widget landScapeContainer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingText(name: "Medasour", color: Colors.white, size: 30),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              pokeContainer(name: "Grass", size: 16, color: Colors.white),
              const SizedBox(
                width: 6,
              ),
              pokeContainer(name: "Poision", size: 16, color: Colors.white),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
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
            Image.asset(
              'assets/images/img1.png',
              width: 150,
            ),
          ],
        ),
      ),
    ],
  );
}
