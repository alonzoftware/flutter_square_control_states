import 'package:bloc/bloc.dart';
import 'package:flutter_square_control_states/src/models/square.dart';
import 'package:meta/meta.dart';

part 'animation_event.dart';
part 'animation_state.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationBloc()
      : super(AnimationState(
          square: Square(dir: 'left', posX: 0.0, posY: 0.0),
          toMove: false,
        ));
  //           {
  //   on<AnimationEvent>((event, emit) {
  //     // TODO: implement event handler
  //     print(event);
  //   });
  // }
  @override
  Stream<AnimationState> mapEventToState(AnimationEvent event) async* {
    print('AnimationBloc : $event');

    if (event is ChangeDir) {
      yield state.copyWith(
        square: state.square.copyWith(dir: event.dir),
        toMove: true,
      );
    } else if (event is SetSquarePosition) {
      yield state.copyWith(
        square: state.square.copyWith(
          posX: event.x,
          posY: event.y,
        ),
        toMove: false,
      );
    }
  }
}
