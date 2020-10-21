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

  bool isReady = false;
  RssFeed x;
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
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          splashColor: Colors.orange,
          child: Icon(Icons.refresh),
          onPressed: () {
            refresh();
          }),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Color.fromRGBO(37, 68, 65, 1),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          _simplePopup(context),
        ],
      ),
      body: isReady
          ? Container(
              color: Color.fromRGBO(37, 68, 65, 1),
              child: ListView.builder(
                itemCount: x.items.length,
                padding: EdgeInsets.all(20),
                // itemCount: x.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      NewsWidget(
                          isChecked: false,
                          desc: x.items[index].description,
                          url: x.items[index].link,
                          title: x.items[index].title),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            )
          : Container(
              color: Color.fromRGBO(37, 68, 65, 1),
              child: Center(
                child: Text(
                  "برای مشاهده اخبار دکمه زیر (⟳) را فشار دهید",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
    );
  }

  void refresh() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );
      var client = new http.Client();
      await client.get(widget.urls[oneToThree.nextInt(2)]) //TODO its a var
          .then((response) {
        return response.body;
      }).then((bodyString) {
        var channel = new RssFeed.parse(bodyString);
        x = null;
        x = channel;
      });
      Navigator.of(context).pop();
      setState(() {
        isReady = true;
      });
    } else {
      showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.blue,
          content: Text("مشکل در برقراری ارتباط با شبکه"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("تایید"),
            ),
          ],
        ),
      );
    }
  }
}
