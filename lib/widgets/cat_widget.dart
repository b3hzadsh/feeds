import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                Center(
                  child: Opacity(
                    opacity: 0.7,
                    child: Icon(
                      Icons.star,
                      color: isTouch ? Colors.yellow : Colors.grey,
                      size: 50,
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
