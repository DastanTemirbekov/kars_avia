import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;

  TimerCubit() : super(TimerInitial());

  void startTimer(int count) {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (count == 0) {
          _timer!.cancel();

          emit(TimerEnd());
        } else {
          count--;

          emit(TimerRunning(count));
        }
      },
    );
  }

  void restartTimer(int count, bool isStart) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (isStart == false) {
          if (count == 0) {
            _timer!.cancel();
            isStart = true;

            emit(TimerEnd());
          } else {
            count--;

            emit(TimerRunning(count));
          }
        }
      },
    );
  }
}
