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
        title: Text("لید خبری"),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white12,
        // alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            // child: AnimationLimiter(
            child: Column(
              /* children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 275),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 70.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ), */
              children: [
                myAnimatedWidget(
                  Text(
                    "موضوعات مورد علاقه خود را انتخاب و دکمه ثبت را فشار دهید",
                    textAlign: TextAlign.center,
                  ),
                ),
                Wrap(
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    myAnimatedWidget(
                      CatCard(
                        cardColor: Colors.white,
                        title: "ورزشی",
                        imageUrl: "assets/images/ball.png",
                        // sport is 0
                      ),
                    ),
                    myAnimatedWidget(
                      CatCard(
                        cardColor: Colors.white,
                        title: "تکنولوژی",
                        imageUrl: "assets/images/IT.jpg",
                        // it is 1
                      ),
                    ),
                    myAnimatedWidget(
                      CatCard(
                        cardColor: Colors.white,
                        title: "دانلود",
                        imageUrl: "assets/images/dl.png",
                        // dl is 2
                      ),
                    ),
                    myAnimatedWidget(
                      CatCard(
                        cardColor: Colors.white,
                        title: "بازی",
                        imageUrl: "assets/images/game.png",
                        // game is 3
                      ),
                    ),
                    myAnimatedWidget(
                      CatCard(
                        cardColor: Colors.white,
                        title: "فیلم و سریال",
                        imageUrl: "assets/images/movie.png",
                        // movie is 4
                      ),
                    ),
                    myAnimatedWidget(
                      CatCard(
                        cardColor: Colors.white,
                        title: "اقتصاد",
                        imageUrl: "assets/images/economy.png",
                        // movie is 4
                      ),
                    ),
                    // add economy politic
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
                    )
                  ],
                ),
              ], /* 
                ),
              ), */
            ),
          ),
        ),
      ),
    );
  }

  Widget myAnimatedWidget(Widget widget) {
    return ShowUpAnimation(
      delayStart: Duration(seconds: 1),
      animationDuration: Duration(seconds: 1),
      curve: Curves.bounceIn,
      direction: Direction.vertical,
      offset: 0.5,
      child: widget,
    );
  }
}
