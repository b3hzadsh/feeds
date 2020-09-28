import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard_temmplate.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'data/feeds.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: SplashScreen(),
    onGenerateRoute: route,
  ));
}

Route route(RouteSettings setting) {
  if (setting.name == "/")
    return MaterialPageRoute(
      builder: (context) => SplashScreen(),
    );
  if (setting.name != null) {
    var temp = setting.name.split("/");
    String id = temp[1].substring(3);
    String title = temp[2].substring(6);
    return MaterialPageRoute(
      builder: (context) => DaashboardTemplate(FeedData.feedUrls[id], title),
    );
  }
}
