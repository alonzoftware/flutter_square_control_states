import 'package:flutter/material.dart';
import 'package:flutter_square_control_states/src/animations/square_animation.dart';
import 'package:flutter_square_control_states/src/services_singleton/animation_service.dart';
import 'package:flutter_square_control_states/src/widgets/square_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                animationService.dir = "left";
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
                animationService.dir = "right";
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
                animationService.dir = "down";
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
                animationService.dir = "up";
              },
            ),
          )
        ],
      ),
    );
  }
}
