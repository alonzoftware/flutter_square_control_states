import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_square_control_states/src/animations/square_animation.dart';
import 'package:flutter_square_control_states/src/models/square.dart';
import 'package:flutter_square_control_states/src/services_cubit/square_service/square_cubit.dart';
import 'package:flutter_square_control_states/src/widgets/square_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final squareCubit = context.read<SquareCubit>();
    final square = Square(posX: 0, posY: 0, dir: 'left');
    squareCubit.setSquare(square);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Stack(
        children: [
          Positioned(
            //SQUARE
            left: screenSize.width * 0.05,
            top: screenSize.height * 0.5,
            child: const SquareAnimation(child: SquareWidget()),
          ),
          Positioned(
            //LEFT BUTTON
            left: screenSize.width * 0.05,
            bottom: screenSize.height * 0.05,
            child: FloatingActionButton(
              child: const Icon(Icons.keyboard_arrow_left_rounded),
              onPressed: () {
                squareCubit.squareMove("left");
              },
            ),
          ),
          Positioned(
            //RIGHT BUTTON

            left: screenSize.width * 0.25,
            bottom: screenSize.height * 0.05,
            child: FloatingActionButton(
              child: const Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: () {
                squareCubit.squareMove("right");
              },
            ),
          ),
          Positioned(
            //DOWN BUTTON
            right: screenSize.width * 0.25,
            bottom: screenSize.height * 0.05,
            child: FloatingActionButton(
              child: const Icon(Icons.keyboard_arrow_down_rounded),
              onPressed: () {
                squareCubit.squareMove("down");
              },
            ),
          ),
          Positioned(
            //UP BUTTON
            right: screenSize.width * 0.05,
            bottom: screenSize.height * 0.05,
            child: FloatingActionButton(
              child: const Icon(Icons.keyboard_arrow_up_rounded),
              onPressed: () {
                squareCubit.squareMove("up");
              },
            ),
          )
        ],
      ),
    );
  }
}
