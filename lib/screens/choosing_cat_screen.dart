import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter_app/widgets/cat_widget.dart';

import 'favorite.dart';
// import 'package:nice_button/nice_button.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';
// import 'dashboard.dart';

class ChoosingCatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "انتخاب دسته ها ",
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritScreen(),
                  ),
                );
              })
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.white12,
          // alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  myAnimatedWidget(
                      Container(
                        child: Text(
                          "مایلید در جریان کدام اخبار قرار بگیرید ؟",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      3),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    // crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 5,
                    children: [
                      myAnimatedWidget(
                          CatCard(
                            id: "sports",
                            cardColor: Colors.white,
                            title: "ورزشی",
                            imageUrl: "assets/images/ball.png",
                            // sport is 9
                          ),
                          4),
                      myAnimatedWidget(
                          CatCard(
                            id: 'it',
                            cardColor: Colors.white,
                            title: "تکنولوژی",
                            imageUrl: "assets/images/IT.jpg",
                            // it is 3
                          ),
                          5),
                      myAnimatedWidget(
                          CatCard(
                            id: 'dls',
                            cardColor: Colors.white,
                            title: "دانلود",
                            imageUrl: "assets/images/dl.png",
                            // dl is 0
                          ),
                          6),
                      myAnimatedWidget(
                          CatCard(
                            id: 'game',
                            cardColor: Colors.white,
                            title: "بازی",
                            imageUrl: "assets/images/game.png",
                            // game is 2
                          ),
                          7),
                      myAnimatedWidget(
                          CatCard(
                            id: 'movie',
                            cardColor: Colors.white,
                            title: "فیلم و سریال",
                            imageUrl: "assets/images/movie.png",
                            // movie is 1
                          ),
                          8),
                      myAnimatedWidget(
                          CatCard(
                            id: 'economy',
                            cardColor: Colors.white,
                            title: "اقتصاد",
                            imageUrl: "assets/images/economy.png",
                            // economy is 4
                          ),
                          9),
                      myAnimatedWidget(
                          CatCard(
                            id: 'politics',
                            cardColor: Colors.white,
                            title: "سیاست",
                            imageUrl: "assets/images/politic.jpg",
                            // economy is 4
                          ),
                          10),
                      myAnimatedWidget(
                          CatCard(
                            id: 'iranianFootbal',
                            cardColor: Colors.white,
                            title: "فوتبال ایران",
                            imageUrl: "assets/images/footbal.png",
                            // economy is 4
                          ),
                          11),
                      myAnimatedWidget(
                          CatCard(
                            id: 'scientificAcademic',
                            cardColor: Colors.white,
                            title: "علمی دانشگاهی",
                            imageUrl: "assets/images/uni.jpg",
                            // economy is 4
                          ),
                          12),
                      myAnimatedWidget(
                          CatCard(
                            id: 'lastNews',
                            cardColor: Colors.white,
                            title: "تازه ترین اخبار",
                            imageUrl: "assets/images/breaking.png",
                            // economy is 4
                          ),
                          13),
                      // add economy politic
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myAnimatedWidget(Widget widget, int index) {
    return ShowUpAnimation(
      delayStart: Duration(milliseconds: 400 * index),
      animationDuration: Duration(milliseconds: 350),
      curve: Curves.bounceIn,
      direction: Direction.horizontal,
      offset: (index % 2 == 0) ? 0.4 : -0.4,
      child: widget,
    );
  }
  /* Widget Navigator ({Widget child ,String title , String id}){

    return GestureDetector(
      child: ,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DaashboardTemplate(FeedData.feedUrls[widget.id], widget.title),
          ),
        );
      },
    );
  } */
  /*  Widget myAnimatedWidget(Widget widget, int index) {
    return Center(
      child: widget,
    );
  } */
}
