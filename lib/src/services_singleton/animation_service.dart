import 'dart:async';
import 'package:flutter/material.dart';

class _AnimationService {
  //Basic Configuration Singletone ------------ Begin
  static _AnimationService? _instance;
  _AnimationService._() {
    // initialization and stuff
  }
  factory _AnimationService() {
    _instance ??= _AnimationService._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }
  //Basic Configuration Singletone ------------ End
  //Simple Variables -------------------------- Begin
  late double _screenHeight;
  double get screenHeight => _screenHeight;
  set screenHeight(double value) {
    _screenHeight = value;
  }

  late double _screenWidth;
  double get screenWidth => _screenWidth;
  set screenWidth(double value) {
    _screenWidth = value;
  }

  double _posX = 0.0;
  double get posX => _posX;
  set posX(double value) {
    _posX = value;
    print('X: $_posX');
  }

  double _posY = 0.0;
  double get posY => _posY;
  set posY(double value) {
    _posY = value;
    print('Y: $_posY');
  }

  //Simple Variables -------------------------- End

  late AnimationController _controller;
  AnimationController get controller => _controller;

  set controller(AnimationController controller) {
    _controller = controller;
  }

  //Streams
  String _dir = "right";
  final StreamController<String> _dirController =
      StreamController<String>.broadcast();
  Stream<String> get dirStream => _dirController.stream;
  Function(String) get dirChange => _dirController.sink.add;
  void dispose() {
    _dirController.close();
  }

  String get dir => _dir;
  set dir(String dirValue) {
    _dir = dirValue;
    dirChange(dirValue);
  }
}

final animationService = _AnimationService();
