import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class NewsWidget extends StatefulWidget {
  final String title;
  final String desc;
  NewsWidget({this.title, this.desc});

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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

    return Column(
      children: <Widget>[
        ListTile(
            // contentPadding: EdgeInsets.symmetric(horizontal: 15),
            title: Text(
              widget.title,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 17.2, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              smallerString(),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            //Paulo [P,a,u,l,o]
            leading: IconButton(
                icon: Icon(
                  Icons.star,
                  color: isChecked ? Colors.yellow : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isChecked = !isChecked;
                  });

                  //TODO make icon yellow and write it in database
                }),
            onTap: () => {}),
        Divider(
          height: 3.4,
        ),
      ],
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
