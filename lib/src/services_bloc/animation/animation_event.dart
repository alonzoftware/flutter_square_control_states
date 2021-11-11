part of 'animation_bloc.dart';

@immutable
abstract class AnimationEvent {}

class ChangeDir extends AnimationEvent {
  final String dir;
  ChangeDir({required this.dir});
}

class SetSquarePosition extends AnimationEvent {
  final double x;
  final double y;
  SetSquarePosition({required this.x, required this.y});
}
