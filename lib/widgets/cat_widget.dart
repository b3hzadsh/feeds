import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CatCard extends StatefulWidget {
  final Color cardColor;
  final String imageUrl;
  final String title;
  CatCard({this.cardColor, this.imageUrl, this.title});
  @override
  _CatCardState createState() => _CatCardState();
}

class _CatCardState extends State<CatCard> {
  bool isTouch = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isTouch = isTouch ? false : true;
        });
        //TODO better way to save this prefs and all favorites in shared prefs
        /* SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('firstLaunch', false); */
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
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ), //TODO clipRrect may need
                Positioned(
                  child: Icon(
                    Icons.star,
                    color: isTouch ? Colors.yellow : Colors.grey,
                  ),
                  top: 10.0,
                  right: 10.0,
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: Color.fromRGBO(110, 150, 220, 0.9),
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
