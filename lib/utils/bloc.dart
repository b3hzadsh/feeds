import 'dart:async';

class MyBloC {
  StreamController _favoriteScreen = StreamController.broadcast();

  get fstream => _favoriteScreen.stream;
  get fchange => _favoriteScreen.sink.add;
  dispose() {
    _favoriteScreen.sink.close();
  }
}

MyBloC bloc = new MyBloC();
