// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, everything
import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_MAIN_BLUE,
      child: Center(
        child: SizedBox(
          height: 400,
          width: 450,
          child: Card(
            color: COLOR_MAIN_GREEN,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage())),
                    child: Container(
                      height: 60,
                      width: 100,
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: COLOR_MAIN_GREEN),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: COLOR_MAIN_BLUE,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
