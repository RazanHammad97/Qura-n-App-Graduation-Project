import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Al Qura\'n"))));
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Container(
            decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                Color(0Xff97a97c),
                Color(0Xff87986a),

              ]),
            ),
              //child:

        ),
          Center(child: Image.asset("assets/splash.png")),
        ]
      ),
    );
  }
}
