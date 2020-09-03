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

// class MyScaff extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("hi"),
//       ),
//       body: Container(
//         color: Colors.blueAccent,
//       ),
//     );
//   }
// }
