// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

const COLOR_MAIN_BLUE = Color.fromRGBO(1, 10, 45, 1);
const COLOR_MAIN_GREEN = Color.fromRGBO(109, 241, 6, 1);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
