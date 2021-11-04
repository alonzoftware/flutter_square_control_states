import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareAnimation extends StatefulWidget {
  late Widget child;
  SquareAnimation({Key? key, required this.child}) : super(key: key);

  @override
  State<SquareAnimation> createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<SquareAnimation> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
