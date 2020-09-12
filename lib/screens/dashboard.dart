import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/choosing_cat_screen.dart';
import 'package:flutter_app/widgets/news_widget.dart';
import 'package:http/http.dart' as http;
import 'package:dart_rss/dart_rss.dart';

class DashBoard extends StatefulWidget {
  // get favorite from splash or dashboard
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // int _value = 1;
  RssFeed x; //TODO its a list
  bool isReady = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("صفحه اول "),
        actions: [
          /* IconButton(icon: Icon(Icons.refresh), onPressed: refresh),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => ChoosingCatScreen()));
              }) */

          DropdownButton<String>(
            isDense: true,
            icon: Icon(
              Icons.more_vert,
              size: 45,
              color: Colors.white,
            ),
            items: <String>['اپدیت‌اخبار', 'تغییر‌دسته‌ها'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (String value) async {
              if (value == 'اپدیت‌اخبار') {
                refresh();
              }
              if (value == 'تغییر‌دسته‌ها') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => ChoosingCatScreen(),
                  ),
                );
              }
            },
          )
        ],
      ),
      body: isReady
          ? Container(
              child: RefreshIndicator(
                onRefresh: () async {
                  refresh();
                },
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  // itemCount: x.items.length,
                  itemBuilder: (context, index) {
                    return NewsWidget(
                        // TODO get from list
                        desc: x.items[index].description,
                        title: x.items[index].title);
                  },
                ),
              ),
            )
          : RefreshIndicator(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        /*  child: RaisedButton(onPressed: () {}), */
                        ),
                  ],
                ),
              ),
              onRefresh: () async {
                refresh();
              }),
    );
  }

  void refresh() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var client = new http.Client();
      await client.get("https://www.isna.ir/rss") //TODO its a var
          .then((response) {
        return response.body;
      }).then((bodyString) {
        var channel = new RssFeed.parse(bodyString);
        x = channel;
      });
      setState(() {
        isReady = true;
      });
    }
  }
}
