import 'package:flutter/material.dart';

class StetefullString extends StatefulWidget {
  @override
  _StetefullStringState createState() => _StetefullStringState();
}

class _StetefullStringState extends State<StetefullString> {
  TextEditingController txtctl = new TextEditingController();
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull String"),
      ),
      body: Container(
        // color: Colors.purpleAccent,
        child: Center(
          child: Column(
            children: [
              Text(
                "$title",
                style: TextStyle(fontSize: 45),
              ),
              TextField(
                controller: txtctl,
                onChanged: (value) {
                  setState(
                    () {
                      title = value;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
