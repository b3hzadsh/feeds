import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/choosing_cat_screen.dart';
// import 'package:flutter_app/screens/dashboard.dart';
import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    // TODO: implement initState
    super.initState();
    controller.forward();
    Timer(
      Duration(milliseconds: 5600),
      toRightSScreen,
    );
    // Timer(Duration(seconds: 8), toRightSScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: AnimatedDrawing.svg(
                    "assets/images/rss.svg",
                    controller: controller,
                    onFinish: () {
                      controller.dispose();
                    },
                    animationCurve: Curves.easeInOutBack,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 7,
                height: MediaQuery.of(context).size.width / 7,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toRightSScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChoosingCatScreen(),
      ),
    );
  }
}
