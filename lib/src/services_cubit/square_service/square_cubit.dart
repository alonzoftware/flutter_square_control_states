import 'package:bloc/bloc.dart';
import 'package:flutter_square_control_states/src/models/square.dart';
import 'package:meta/meta.dart';

part 'square_state.dart';

class SquareCubit extends Cubit<SquareState> {
  SquareCubit() : super(SquareInitial());
  void setSquare(Square newSquare) {
    emit(SquareActivo(newSquare, false));
  }

  void squareMove(String dir) {
    final currentState = state;
    if (currentState is SquareActivo) {
      final newSquare = currentState.square.copyWith(dir: dir);
      emit(SquareActivo(newSquare, true));
    }
  }

  void setSquarePosition(double x, double y) {
    final currentState = state;
    if (currentState is SquareActivo) {
      final newSquare = currentState.square.copyWith(posX: x, posY: y);
      emit(SquareActivo(newSquare, false));
    }
  }
}
