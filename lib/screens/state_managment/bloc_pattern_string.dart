import 'package:flutter/material.dart';
import 'bloc.dart';

class BlocPatternString extends StatelessWidget {
  final TextEditingController txtctl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BloC Pattern String"),
      ),
      body: Container(
        // color: Colors.purpleAccent,
        child: Center(
          child: Column(
            children: [
              StreamBuilder(
                builder: (context, snapshot) {
                  return Text(
                    snapshot.hasData ? snapshot.data : "nothing yet",
                    style: TextStyle(fontSize: 20),
                  );
                },
                stream: bloc.counter,
              ),
              TextField(
                controller: txtctl,
                onChanged: (value) {
                  bloc.counterChange(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
