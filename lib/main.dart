import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard_temmplate.dart';
import 'package:flutter_app/screens/favorite.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'data/feeds.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      /*  theme: ThemeData(
        fontFamily: 'D',
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0XFFBBDEFB),
        primaryColor: Color(0XFFffffff),
        primaryColorDark: Color(0XFF1976D2),
        /* textTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0XFF212121),
            fontFamily: "B",
          ),
          headline1: TextStyle(color: Color(0XFF212121)),
          subtitle1: TextStyle(color: Color(0XFF757575)),
        ), */
        dividerColor: Color(0XFFBDBDBD),
        accentColor: Color(0XFF483D3F),
        /* primaryTextTheme: TextTheme(
          caption: TextStyle(
            color: Color(0XFF212121),
          ),
        ), */
      ), */
      // home: SplashScreen(),
      onGenerateRoute: route,
      /* theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo,
          accentColor: Colors.indigoAccent), */
    ),
  );
}

Route route(RouteSettings setting) {
  if (setting.name == "/")
    return MaterialPageRoute(
      builder: (context) => SplashScreen(),
    );
  else if (setting.name == "/favorite")
    return MaterialPageRoute(
      builder: (context) => FavoritScreen(),
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
