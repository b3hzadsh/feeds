import 'package:flutter/material.dart';
import 'package:flutter_app/screens/choosing_cat_screen.dart';
import 'package:flutter_app/screens/dashboard_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  /* if (prefs.getBool('firstLaunch') == null) {
    prefs.setBool('firstLaunch', true);
  } */
  // bool x = prefs.getBool('firstLaunch');
  //TODO shared prefrences for first launch
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChoosingCatScreen(), // x ? ChoosingCatScreen() : Dashboard(),
    //TODO add splashscreen to avoid dahboard
  ));
}

class MyScaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
      body: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}
