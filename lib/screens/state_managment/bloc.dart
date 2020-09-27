import 'dart:async';

class BloC {
  final StreamController _counterController = StreamController<String>();
  Stream<String> get counter => _counterController.stream;
  Function(String) get counterChange =>
      _counterController.sink.add; //TODO may should be String

  void dispose() {
    _counterController.close();
  }
}

final BloC bloc = new BloC(); // always initiat with new
