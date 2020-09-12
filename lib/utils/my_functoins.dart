// import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class WowFeeds {
  List<int> activeFeed;
  SharedPreferences prefs;
  List<String> prefsId = [
    'dls',
    'movie',
    'game',
    'it',
    'economy',
    'lastNews',
    'politics',
    'scientificAcademic',
    'iranianFootbal',
    'sports',
    'boors'
  ];
//TODO lots of this ! is realy required ?
  void prefInit() async {
    this.prefs = await SharedPreferences.getInstance();
  }

  List<int> getActiveFeed() {
    prefInit();
    for (int i = 0; i < 11; i++) {
      if (this.prefs.getBool(this.prefsId[i]) == true) {
        this.activeFeed[this.activeFeed.length] = i;
      }
    }
    return this.activeFeed;
  }
}
