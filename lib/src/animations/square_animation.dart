import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_square_control_states/src/services_cubit/square_service/square_cubit.dart';

class SquareAnimation extends StatefulWidget {
  final Widget child;
  const SquareAnimation({Key? key, required this.child}) : super(key: key);
  @override
  State<SquareAnimation> createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<SquareAnimation>
    with SingleTickerProviderStateMixin {
  //  late AnimationController controller;
  late final squareCubit;
  late AnimationController controller;
  late Animation<double> move;
  double iniX = 0; //squareCubit.posX;
  double iniY = 0; //squareCubit.posY;
  String dir = "left";
  @override
  void initState() {
    super.initState();
    // animationService = Provider.of<AnimationService>(context, listen: false);
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    move = Tween(begin: 0.0, end: 45.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    squareCubit = context.read<SquareCubit>();
    context.read<SquareCubit>().stream.listen((state) {
      if (state is SquareActivo && !controller.isAnimating) {
        print('x: $iniX , y: $iniY, dir: $dir');
        if (state.toMove) {
          iniX = state.square.posX;
          iniY = state.square.posY;
          dir = state.square.dir;
          controller.reset();
          controller.forward();
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //animationService.controller.reset();
    //animationService.controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        // print('moveRight: ${moveRight.status}');
        // print('moveUp: ${moveUp.status}');
        //print('move: ${move.value}');
        double x = iniX;
        double y = iniY;
        switch (dir) {
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
        //print('x: $x , y: $y');
        if (move.isCompleted) {
          print('x: $x , y: $y, dir: $dir');
          squareCubit.setSquarePosition(x, y);
        }
        return Transform.translate(
          offset: Offset(x, y),
          child: child,
        );
      },
    );
  }
}
