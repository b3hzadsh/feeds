import 'package:flutter/material.dart';
import 'package:flutter_app/screens/choosing_cat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
