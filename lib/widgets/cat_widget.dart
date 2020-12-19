import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CatCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/id:$id/title:$title");
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
                      decoration: new BoxDecoration(
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
                            imageUrl,
                          ),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 2.5),
                    blurRadius: 6.0)
              ],
            ),
          ),
          Text(
            title,
            style: TextStyle(
              //color: Color.fromRGBO(235, 235, 235, 1),
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
