// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pokemon_app/const/api_services.dart';
import 'package:pokemon_app/const/heading.dart';
import 'package:pokemon_app/const/poke_type_container.dart';
import 'package:pokemon_app/const/row_styling.dart';
import 'package:pokemon_app/const/state_row.dart';
import 'package:pokemon_app/landscape_container.dart';
import 'package:pokemon_app/potrait_container.dart';

class DetailedScreen extends StatelessWidget {
  final dynamic data;
  DetailedScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                child: orientation == Orientation.portrait
                    ? potraitContainer(data)
                    : landScapeContainer(),
              )),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.green,
                        tabs: [
                          Tab(
                            text: "Medasour",
                          ),
                          Tab(
                            text: "Base Stats",
                          )
                        ]),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: headingText(
                                    name: data['xdescription'],
                                    size: 16,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: SizedBox(
                                  width: sizee - 100,
                                  child: Card(
                                    color: Colors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              headingText(
                                                  name: "Height",
                                                  size: 16,
                                                  color: Colors.black),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              headingText(
                                                  name: data['height'],
                                                  size: 16,
                                                  color: Colors.black)
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              headingText(
                                                  name: "Energy",
                                                  size: 16,
                                                  color: Colors.black),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              headingText(
                                                  name: data['hp'].toString(),
                                                  size: 16,
                                                  color: Colors.black)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              headingText(
                                  name: "Breading",
                                  size: 16,
                                  color: Colors.black),
                              SizedBox(
                                height: 10,
                              ),
                              rowStyling(
                                  name: "Male %",
                                  value: data['male_percentage']),
                              rowStyling(
                                  name: "Egg Cycle", value: data['cycles']),
                              rowStyling(
                                  name: "Evolution",
                                  value: data['evolution'].toString()),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              stateRow(
                                  name: "HP", value: data['hp'].toString()),
                              stateRow(
                                  name: "Attack",
                                  value: data['attack'].toString()),
                              stateRow(
                                  name: "Defense",
                                  value: data['defense'].toString()),
                              stateRow(
                                  name: "Evolution",
                                  value: data['speed'].toString()),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
