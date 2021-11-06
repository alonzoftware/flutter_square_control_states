part of 'square_cubit.dart';

@immutable
abstract class SquareState {}

class SquareInitial extends SquareState {}

class SquareActivo extends SquareState {
  final Square square;
  final bool toMove;
  SquareActivo(this.square, this.toMove);
}
