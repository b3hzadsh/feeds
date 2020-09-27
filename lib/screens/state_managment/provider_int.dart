import 'package:flutter/material.dart';
import 'package:flutter_app/screens/state_managment/provider.dart';
import 'package:provider/provider.dart';

class ProviderInt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrIns = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Int"),
      ),
      body: Container(
        color: Colors.purpleAccent,
        child: Center(
          child: Consumer<Counter>(
            builder: (_, ctrIns, __) => Text(
              ctrIns.counter.toString(),
              style: TextStyle(fontSize: 45),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ctrIns.inc();
        },
      ),
    );
  }
}
