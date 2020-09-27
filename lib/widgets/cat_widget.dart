import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/data/feeds.dart';
import 'package:flutter_app/screens/dashboard_temmplate.dart';
import '../utils/my_functoins.dart';

class CatCard extends StatefulWidget {
  @required
  final String id;

  @required
  final Color cardColor;

  @required
  final String imageUrl;
  @required
  final String title;
  CatCard({this.cardColor, this.imageUrl, this.title, this.id});
  @override
  _CatCardState createState() => _CatCardState();
}

class _CatCardState extends State<CatCard> with WowFeeds {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DaashboardTemplate(FeedData.feedUrls[widget.id], widget.title),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.width / 2.7,
            width: MediaQuery.of(context).size.width / 2.7,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.3),
                          Colors.black.withOpacity(.1)
                        ], begin: Alignment.bottomRight),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            widget.imageUrl,
                          ),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 2.5),
                    blurRadius: 6.0)
              ],
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
