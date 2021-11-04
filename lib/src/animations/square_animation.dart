import 'package:flutter/material.dart';
import 'package:flutter_square_control_states/src/services_singleton/animation_service.dart';

class SquareAnimation extends StatefulWidget {
  final Widget child;
  const SquareAnimation({Key? key, required this.child}) : super(key: key);
  @override
  State<SquareAnimation> createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<SquareAnimation>
    with SingleTickerProviderStateMixin {
  //  late AnimationController controller;

  late Animation<double> move;

  @override
  void initState() {
    animationService.controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();

    move = Tween(begin: 0.0, end: 55.0).animate(CurvedAnimation(
        parent: animationService.controller, curve: Curves.bounceOut));

    animationService.dirStream.listen((dirValue) {
      // switch (dirValue) {
      //   case 'left':
      //     break;
      //   case 'right':
      //     break;
      //   case 'down':
      //     break;
      //   case 'up':
      //     break;
      //   default:
      // }
      if (move.isCompleted || move.isDismissed) {
        animationService.controller.reset();
        animationService.controller.forward();
      }
    });
  }

  @override
  void dispose() {
    animationService.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // animationService.controller.forward();

    return AnimatedBuilder(
      animation: animationService.controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        // print('moveRight: ${moveRight.status}');
        // print('moveUp: ${moveUp.status}');
        double x = animationService.posX;
        double y = animationService.posY;
        switch (animationService.dir) {
          case 'left':
            x -= move.value;
            break;
          case 'right':
            x += move.value;
            break;
          case 'up':
            y -= move.value;
            break;
          case 'down':
            y += move.value;
            break;
          default:
        }
        if (move.isCompleted) {
          animationService.posX = x;
          animationService.posY = y;
        }
        return Transform.translate(
          offset: Offset(x, y),
          child: child,
        );
      },
    );
  }
}
