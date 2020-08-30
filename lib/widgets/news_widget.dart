import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final String desc;
  NewsWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: 3.4,
        ),
        ListTile(
            title: Text(
              (title),
              style: TextStyle(fontSize: 17.2, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(desc),
            //Paulo [P,a,u,l,o]
            leading: CircleAvatar(
              //radius: 45.6,
              backgroundColor: Colors.orange,
              child: Text(title[0]),
            ),
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
