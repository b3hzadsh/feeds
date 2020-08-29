import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter_app/widgets/cat_widget.dart';
import 'package:nice_button/nice_button.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:shared_preferences/shared_preferences.dart';

/* void setPerfs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('firstLaunch', true);
} */

class ChoosingCatScreen extends StatefulWidget {
  @override
  _ChoosingCatScreenState createState() => _ChoosingCatScreenState();
}

class _ChoosingCatScreenState extends State<ChoosingCatScreen> {
  @override
  Widget build(BuildContext context) {
    var firstColor = Colors.blue[300], secondColor = Colors.blue[500];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "انتخاب موضوع",
        ),
        centerTitle: true,
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
                /* children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 70.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ), */
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  myAnimatedWidget(
                      Container(
                        child: Text(
                          "حداقل یک موضوع را انتخاب کنید",
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
                            cardColor: Colors.white,
                            title: "ورزشی",
                            imageUrl: "assets/images/ball.png",
                            // sport is 0
                          ),
                          4),
                      myAnimatedWidget(
                          CatCard(
                            cardColor: Colors.white,
                            title: "تکنولوژی",
                            imageUrl: "assets/images/IT.jpg",
                            // it is 1
                          ),
                          5),
                      myAnimatedWidget(
                          CatCard(
                            cardColor: Colors.white,
                            title: "دانلود",
                            imageUrl: "assets/images/dl.png",
                            // dl is 2
                          ),
                          6),
                      myAnimatedWidget(
                          CatCard(
                            cardColor: Colors.white,
                            title: "بازی",
                            imageUrl: "assets/images/game.png",
                            // game is 3
                          ),
                          7),
                      myAnimatedWidget(
                          CatCard(
                            cardColor: Colors.white,
                            title: "فیلم و سریال",
                            imageUrl: "assets/images/movie.png",
                            // movie is 4
                          ),
                          8),
                      myAnimatedWidget(
                          CatCard(
                            cardColor: Colors.white,
                            title: "اقتصاد",
                            imageUrl: "assets/images/economy.png",
                            // movie is 4
                          ),
                          9),
                      // add economy politic
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  myAnimatedWidget(
                      NiceButton(
                        width: MediaQuery.of(context).size.width / 2,
                        elevation: 2.0,
                        radius: 52.0,
                        text: "ثبت",
                        gradientColors: [secondColor, firstColor],
                        background: Colors.blueAccent,
                        onPressed: () {
                          print("hello");
                        },
                      ),
                      10),
                ], /* 
                  ),
                ), */
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myAnimatedWidget(Widget widget, int index) {
    return ShowUpAnimation(
      delayStart: Duration(milliseconds: 500 * index),
      animationDuration: Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      direction: Direction.horizontal,
      offset: (index % 2 == 0) ? 0.6 : -0.6,
      child: widget,
    );
  }
}
