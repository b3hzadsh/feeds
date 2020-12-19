import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
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
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    /* Timer(
      Duration(milliseconds: 5500),
      toRightSScreen,
    ); */
    controller.forward();

    // Timer(Duration(seconds: 8), toRightSScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.width / 1.2,
                child: AnimatedDrawing.svg(
                  "assets/images/rss.svg",
                  controller: controller,
                  onFinish: () {
                    controller.dispose();
                    toRightSScreen();
                  },
                  animationCurve: Curves.easeInOutBack,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 8,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toRightSScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil("/cat", (route) => false);
  }
}
