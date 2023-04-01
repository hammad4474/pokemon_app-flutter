// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokemon_app/const/api_services.dart';
import 'package:pokemon_app/const/heading.dart';
import 'package:pokemon_app/const/poke_type_container.dart';
import 'package:pokemon_app/detailed_screen.dart';

class PokeScreen extends StatefulWidget {
  const PokeScreen({super.key});

  @override
  State<PokeScreen> createState() => _PokeScreenState();
}

class _PokeScreenState extends State<PokeScreen> {
  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.purple, Colors.yellow])),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'PokeMon',
                  style: TextStyle(
                      fontFamily: 'circula_bold',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getApiInfo(),
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                      if (snapshot.hasData) {
                        return GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: sizee < 600
                                        ? 2
                                        : sizee < 1100
                                            ? 4
                                            : 6,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailedScreen(
                                                data: data[index],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                          colors: [Colors.red, Colors.blue])),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -20,
                                        right: -20,
                                        child: Image.asset(
                                          "assets/images/pokeball.png",
                                          width: 150,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Image(
                                            image: NetworkImage(
                                                data[index]['imageurl']),
                                            width: 120,
                                          )),
                                      Positioned(
                                          top: 20,
                                          left: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              headingText(
                                                  name: data[index]['name'],
                                                  color: Colors.black,
                                                  size: 24.0),
                                              pokeContainer(
                                                  name: data[index]['abilities']
                                                      .toString(),
                                                  color: Colors.black,
                                                  size: 16),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              pokeContainer(
                                                  name: data[index]['category'],
                                                  color: Colors.black,
                                                  size: 16),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(Colors.lightGreen),
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.lightGreen),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
