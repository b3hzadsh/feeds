import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final String desc;
  NewsWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    String smallerString() {
      var spilited = desc.split(" ");
      String temp = "";
      for (int i = 0; i < 5; i++) {
        temp += spilited[i] + " ";
      }
      temp += ".... ";
      return temp;
    }

    return Column(
      children: <Widget>[
        Divider(
          height: 3.4,
        ),
        ListTile(
            // contentPadding: EdgeInsets.symmetric(horizontal: 15),
            title: Text(
              title,
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
                icon: Icon(Icons.star),
                onPressed: () {
                  //TODO make icon yellow and write it in database
                }),
            onTap: () => {})
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
