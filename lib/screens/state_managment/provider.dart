import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int counter = 5;
  void inc() {
    counter++;
    notifyListeners();
  }
}

class TitleString with ChangeNotifier {
  String title = " ";
  void changeTitle(String value) {
    title = value;
    notifyListeners();
  }
}
