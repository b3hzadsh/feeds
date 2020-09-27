import 'package:flutter/material.dart';
import 'package:flutter_app/screens/splash_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
        SplashScreen(), //ChoosingCatScreen(), // x ? ChoosingCatScreen() : Dashboard(),
    //TODO add splashscreen to avoid dahboard
  ));
}
