import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
            child: Image.asset(
          'assets/splash.png',
          fit: BoxFit.fill,
        )),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "V 1.0",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                // padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    "T",
                    style: TextStyle(color: Colors.white, fontSize: 60.0),
                  ),
                ),
              ),
              Text(
                "Taskly",
                style: TextStyle(color: Colors.black, fontSize: 60.0),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
