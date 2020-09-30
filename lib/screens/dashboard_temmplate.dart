import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app/screens/choosing_cat_screen.dart';
import 'package:flutter_app/widgets/news_widget.dart';
import 'package:http/http.dart' as http;
import 'package:dart_rss/dart_rss.dart';

class DaashboardTemplate extends StatefulWidget {
  final List<String> urls;
  final String title;

  DaashboardTemplate(this.urls, this.title);

  @override
  _DaashboardTemplateState createState() => _DaashboardTemplateState();
}

class _DaashboardTemplateState extends State<DaashboardTemplate> {
  Random oneToThree = new Random();

  RssFeed x;
  bool isReady = false;

  Widget _simplePopup(BuildContext context) => PopupMenuButton<int>(
        color: Colors.white,
        icon: Icon(Icons.more_vert),
        onSelected: (value) async {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => ChoosingCatScreen(),
              ),
            );
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "انتخاب دسته",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "state managment",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {
                showDialog(
                  context: context,
                  child: new AlertDialog(
                    // title: new Text(""),
                    content: Container(
                      color: Colors.white10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                );
                // Navigator.of(context).push(route)

                refresh();
              },
              child: Text(
                "به‌روز‌رسانی",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          /*  IconButton(
              icon: Icon(Icons.fullscreen),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => SplashScreen(),
                  ),
                );
              }), */

          _simplePopup(context),
        ],
      ),
      body: isReady
          ? ListView.builder(
              itemCount: x.items.length,
              padding: EdgeInsets.all(20),
              // itemCount: x.items.length,
              itemBuilder: (context, index) {
                return NewsWidget(
                    // TODO get from list
                    desc: x.items[index].description,
                    url: x.items[index].link,
                    title: x.items[index].title);
              },
            )
          : Center(
              child: Text(
                "برای مشاهده اخبار دکمه به‌روز‌رسانی را فشار دهید",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
    );
  }

  void refresh() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var client = new http.Client();
      await client.get(widget.urls[oneToThree.nextInt(2)]) //TODO its a var
          .then((response) {
        return response.body;
      }).then((bodyString) {
        var channel = new RssFeed.parse(bodyString);
        x = channel;
      });
      Navigator.of(context).pop();
      setState(() {
        isReady = true; //TODO use provider
      });
    }
  }
}
