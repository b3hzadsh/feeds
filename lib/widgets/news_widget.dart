import 'package:flutter/material.dart';
import 'package:flutter_app/utils/bloc.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/news_model.dart';
import '../utils/DataBase.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class NewsWidget extends StatefulWidget {
  @required
  final bool isChecked;
  final String title;
  final String desc;
  final String url;
  NewsWidget({this.title, this.desc, this.url, this.isChecked});

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  bool tempIsChecked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempIsChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String smallerString() {
      var spilited = widget.desc.split(" ");
      var range = spilited.length;
      String temp = "";
      for (int i = 0; i < 8 && i < range; i++) {
        temp += spilited[i] + " ";
      }
      temp += ".... ";
      return temp;
    }

    return Container(
      decoration: BoxDecoration(
        //color: Colors.white,
        /* border: Border.all(
              width: 1.3,
              color: Colors.black38,
            ), */
        borderRadius: BorderRadius.circular(width / 20),
      ),
      child: ListTile(
          // contentPadding: EdgeInsets.symmetric(horizontal: 15),
          title: Text(
            widget.title,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Color(0XFF212121).withOpacity(0.9),
                // color: Colors.white,
                fontSize: 17.2,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            smallerString(),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0XFF757575),
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.star,
                  color: tempIsChecked
                      ? Color.fromRGBO(255, 200, 0, 1)
                      : Colors.grey),
              onPressed: () async {
                tempIsChecked = !tempIsChecked;

                if (tempIsChecked) {
                  NewsModel x = NewsModel(
                      url: widget.url, desc: widget.desc, title: widget.title);
                  try {
                    await DBProvider.db.newClient(x);
                    //bloc.fchange(1);
                  } catch (e) {
                    print(e);
                  }
                } else {
                  await DBProvider.db.deleteClient(widget.url);
                  // bloc.fchange(1);
                }
                setState(() {});

                //TODO make icon yellow and write it in database
              }),
          onTap: () async => {
                if (await canLaunch(widget.url))
                  {
                    await launch(widget.url),
                  }
                else
                  {
                    throw 'Could not launch url',
                  }
              }),
    );

    /* Expanded(
      child: Container(
        height: 60,
        width: 300,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            /*  SizedBox(
              height: 5,
            ), */
            Text(
              desc,
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
            ),
          ],
        ), ),);*/
  }
}
