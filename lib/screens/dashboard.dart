import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/news_widget.dart';
import 'package:http/http.dart' as http;
import 'package:dart_rss/dart_rss.dart';
// import 'dart:async';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  RssFeed x;
  bool isReady = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("صفحه اول "),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                var client = new http.Client();
                await client
                    .get("https://www.farsnews.ir/rss/mostvisitednews")
                    .then((response) {
                  return response.body;
                }).then((bodyString) {
                  var channel = new RssFeed.parse(bodyString);
                  x = channel;
                });
                setState(() {
                  isReady = true;
                });
              })
        ],
      ),
      body: isReady
          ? Container(
              child: ListView.builder(
                padding: EdgeInsets.all(4.5),
                itemCount: x.items.length,
                itemBuilder: (context, index) {
                  return NewsWidget(
                      desc: x.items[index].description,
                      title: x.items[index].title);
                },
              ),
            )
          : Center(child: RaisedButton(onPressed: () {})),
    );
  }
}
