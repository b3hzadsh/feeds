import 'package:flutter/material.dart';
import 'package:flutter_app/screens/state_managment/bloc_pattern_int.dart';
import 'package:flutter_app/screens/state_managment/bloc_pattern_string.dart';
import 'package:flutter_app/screens/state_managment/provider.dart';
import 'package:flutter_app/screens/state_managment/provider_int.dart';
import 'package:flutter_app/screens/state_managment/provider_string.dart';
import 'package:flutter_app/screens/state_managment/statefull_int.dart';
import 'package:flutter_app/screens/state_managment/statefull_string.dart';
import 'package:provider/provider.dart';

class SteteManagmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Managment"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myButton(
                  title: "statefull int",
                  screen: MaterialPageRoute(
                    builder: (context) => StetefullInt(),
                  ),
                  context: context),
              myButton(
                  title: "statefull String",
                  screen: MaterialPageRoute(
                    builder: (context) => StetefullString(),
                  ),
                  context: context),
              myButton(
                  title: "provider int",
                  screen: MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<Counter>(
                        child: ProviderInt(), create: (context) => Counter(),),
                  ),
                  context: context),
              myButton(
                  title: "provider string",
                  screen: MaterialPageRoute(
                    builder: (context) => ProviderString(),
                  ),
                  context: context),
              myButton(
                  title: "Bloc int",
                  screen: MaterialPageRoute(
                    builder: (context) => BlocPatternInt(),
                  ),
                  context: context),
              myButton(
                  title: "Bloc String",
                  screen: MaterialPageRoute(
                    builder: (context) => BlocPatternString(),
                  ),
                  context: context),
            ],
          ),
        ),
      ),
    );
  }

//  e26e43    f8ce0e
  Widget myButton(
      {@required String title,
      @required MaterialPageRoute screen,
      @required BuildContext context}) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
            tileMode: TileMode.mirror,
            colors: [Colors.orange, Colors.yellowAccent]).createShader(bounds);
      },
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, screen);
        },
        child: Text(title),
      ),
    );
  }
}
