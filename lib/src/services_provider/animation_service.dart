import 'package:flutter/material.dart';

class AnimationService with ChangeNotifier {
  //Simple Variables -------------------------- Begin
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

  String _dir = "right";
  String get dir => _dir;
  set dir(String dirValue) {
    _dir = dirValue;
    if (!_controller.isAnimating) {
      notifyListeners();
      _controller.reset();
      _controller.forward();
    } else {
      print('controller animating !!');
    }
  }
  //Simple Variables -------------------------- End

  //Controllers ------------------------------- Begin
  late AnimationController _controller;
  AnimationController get controller => _controller;

  set controller(AnimationController controller) {
    _controller = controller;
  }
  //Controllers ------------------------------- End
}
