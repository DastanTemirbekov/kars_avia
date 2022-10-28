/* External dependencies */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/widgets/timer/cubit/timer_cubit.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  TimerCubit? timerCubit;
  bool buttonClicked = false;
  int seconds = 45;

  @override
  void initState() {
    timerCubit = TimerCubit();
    timerCubit!.startTimer(seconds);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      bloc: timerCubit,
      builder: (context, state) {
        if (state is TimerInitial) {
          return const Text('');
        } else if (state is TimerRunning) {
          buttonClicked = false;
          return Text(
            '${state.duration} секунд',
            style: TextHelper.sf12normal,
          );
        }

        return InkWell(
          onTap: () {
            timerCubit!.restartTimer(seconds, buttonClicked);
          },
          child: Text(
            'Отправить SMS еще раз.',
            style: TextHelper.sf12normal.copyWith(
              color: ThemeHelper.lightBlue,
            ),
          ),
        );
      },
    );
  }
}

// для фортмата времени
// String? formatHHMMSS(int seconds) {
//   int hours = (seconds / 3600).truncate();
//   seconds = (seconds % 3600).truncate();
//   int minutes = (seconds / 60).truncate();

//   String hoursStr = (hours).toString().padLeft(2, '0');
//   String minutesStr = (minutes).toString().padLeft(2, '0');
//   String secondsStr = (seconds % 60).toString().padLeft(2, '0');

//   if (hours == 0) {
//     return "$minutesStr:$secondsStr";
//   }
// }
