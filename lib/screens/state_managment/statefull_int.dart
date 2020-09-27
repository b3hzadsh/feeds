import 'package:flutter/material.dart';

class StetefullInt extends StatefulWidget {
  @override
  _StetefullIntState createState() => _StetefullIntState();
}

class _StetefullIntState extends State<StetefullInt> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Int"),
      ),
      body: Container(
        // color: Colors.purpleAccent,
        child: Center(
          child: Text(
            "$counter",
            style: TextStyle(fontSize: 45),
          ),
        ),
      ),
      floatingActionButton: Container(
        color: Colors.blue,
        child: IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.add,
              color: Colors.yellowAccent,
            ),
            onPressed: () {
              //TODO place to add statemanagment pattern
              setState(() {
                counter++;
              });
            }),
      ),
    );
  }
}
