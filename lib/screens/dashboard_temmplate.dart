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
        // color: Colors.white,
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
              //style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          //foregroundColor: Colors.white,
          // splashColor: Colors.orange,
          child: Icon(
            Icons.refresh,
          ),
          onPressed: () {
            refresh();
          }),
      appBar: AppBar(
        elevation: 0.5,
        // backgroundColor: Color.fromRGBO(37, 68, 65, 1),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: "D"),
          // style: TextStyle(color: Colors.white),
        ),
        actions: [
          _simplePopup(context),
        ],
      ),
      body: isReady
          ? Container(
              // color: Color.fromRGBO(37, 68, 65, 1),
              child: ListView.builder(
                itemCount: x.items.length,
                padding: EdgeInsets.all(5),
                // itemCount: x.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      NewsWidget(
                          isChecked: false,
                          desc: x.items[index].description,
                          url: x.items[index].link,
                          title: x.items[index].title),
                      /* SizedBox(
                        height: 8,
                      ), */
                      Divider()
                    ],
                  );
                },
              ),
            )
          : Container(
              // color: Color.fromRGBO(37, 68, 65, 1),
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
      await client.get(widget.urls[oneToThree.nextInt(2)]).then((response) {
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
          insetPadding: EdgeInsets.symmetric(horizontal: 1),
          // backgroundColor: Colors.red,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("خطا"),
              Icon(
                Icons.error,
                color: Colors.red,
              ),
            ],
          ),
          // backgroundColor: Colors.blue,
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
