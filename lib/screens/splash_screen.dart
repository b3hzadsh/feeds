import 'package:flutter/material.dart';
import 'package:flutter_app/screens/choosing_cat_screen.dart';
import 'package:flutter_app/screens/dashboard.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), toRightSScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
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
