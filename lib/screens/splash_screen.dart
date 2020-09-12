import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/choosing_cat_screen.dart';
import 'package:flutter_app/screens/dashboard.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
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
    Timer(Duration(seconds: 6), toRightSScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        margin: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: AnimatedDrawing.svg(
                  "assets/images/rss.svg",
                  controller: controller,
                ),
              ),
              Container(
                child: CircularProgressIndicator(),
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toRightSScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final firstRun = prefs.getBool('first run') ?? 0;
    if (firstRun == 0 || firstRun == false) {
      prefs.setBool('first run', true);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ChoosingCatScreen(),
        ),
      );
    } else
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      );
  }
}
