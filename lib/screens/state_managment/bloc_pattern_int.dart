import 'package:flutter/material.dart';
import 'bloc.dart';

class BlocPatternInt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Int"),
      ),
      body: Container(
        color: Colors.purpleAccent,
        child: Center(
          child: /* Container() */
              StreamBuilder(
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data.toString() : "0",
                style: TextStyle(fontSize: 45),
              );
            },
            stream: bloc.counter,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counter++;
          bloc.counterChange(counter.toString());
        },
      ),
    );
    ;
  }
}
