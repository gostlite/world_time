
import 'package:flutter/material.dart';
import "package:world_time/pages/home.dart";
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/country.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/":(context) =>const Loading(),
      "/home" :(context) =>const Home(),
      "/country": (context) => const Country(),
    },

  ));
}

