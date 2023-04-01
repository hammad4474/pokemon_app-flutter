import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var link =
    'https://raw.githubusercontent.com/hungps/flutter_pokedex/master/assets/pokemons.json';

Future getApiInfo() async {
  var response = await http.get(Uri.parse(link));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    print("Recieved the data");
    return data;
  } else {
    return data;
  }
}
