import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/cat_widget.dart';
import 'package:nice_button/nice_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
        // alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 775),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 70.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Text(
                      "موضوعات مورد علاقه خود را انتخاب و دکمه ثبت را فشار دهید",
                      textAlign: TextAlign.center,
                    ),
                    Wrap(
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        CatCard(
                          cardColor: Colors.white,
                          title: "ورزشی",
                          imageUrl: "assets/images/ball.png",
                          // sport is 0
                        ),
                        CatCard(
                          cardColor: Colors.white,
                          title: "تکنولوژی",
                          imageUrl: "assets/images/IT.jpg",
                          // it is 1
                        ),
                        CatCard(
                          cardColor: Colors.white,
                          title: "دانلود",
                          imageUrl: "assets/images/dl.png",
                          // dl is 2
                        ),
                        CatCard(
                          cardColor: Colors.white,
                          title: "بازی",
                          imageUrl: "assets/images/game.png",
                          // game is 3
                        ),
                        CatCard(
                          cardColor: Colors.white,
                          title: "فیلم و سریال",
                          imageUrl: "assets/images/movie.png",
                          // movie is 4
                        ),
                        CatCard(
                          cardColor: Colors.white,
                          title: "اقتصاد",
                          imageUrl: "assets/images/economy.png",
                          // movie is 4
                        ),
                        // add economy politic
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            /* height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3, */
                            child: NiceButton(
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
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        color: Colors.white12,
      ),
    );
  }
}
