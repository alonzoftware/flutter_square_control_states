part of 'animation_bloc.dart';

class AnimationState {
  final Square square;
  final bool toMove;
  AnimationState({
    required this.square,
    required this.toMove,
  });

  AnimationState copyWith({
    Square? square,
    bool? toMove,
  }) {
    return AnimationState(
      square: square ?? this.square,
      toMove: toMove ?? this.toMove,
    );
  }
}
