/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/auth_screen/bloc/auth_bloc.dart';
import 'package:kars_avia/features/presentation/pages/housing_search_screen/housing_search_screen.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';
import 'package:kars_avia/features/presentation/widgets/custom_progress_indicator.dart';
import 'package:kars_avia/features/presentation/widgets/custom_textfield.dart';
import 'package:kars_avia/features/presentation/widgets/flushbar.dart';
import 'package:kars_avia/features/presentation/widgets/timer/timer.dart';

class PinCodeScreen extends StatefulWidget {
  final int code;

  const PinCodeScreen({
    Key? key,
    required this.code,
  }) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController controller = TextEditingController();
  ValueNotifier<bool> showTimer = ValueNotifier<bool>(false);
  late AuthBloc bloc;

  @override
  void initState() {
    bloc = AuthBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 79.h),
              Text(
                'Вход или регистрация',
                style: TextHelper.inter18bold,
              ),
              SizedBox(height: 31.h),
              Text(
                'Введите шестизначный код, который мы отправили на номер +74859608174.',
                textAlign: TextAlign.center,
                style: TextHelper.sf13bold,
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                controller: controller,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.h),
              Text(
                'Подтвердите, что этот номер телефона принадлежит вам. Введите код, который мы отправили по SMS.',
                textAlign: TextAlign.center,
                style: TextHelper.sf12normal.copyWith(color: ThemeHelper.grey),
              ),
              SizedBox(height: 32.h),
              ValueListenableBuilder<bool>(
                  valueListenable: showTimer,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return const Timer();
                  }),
              SizedBox(height: 9.h),
              BlocListener<AuthBloc, AuthState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is LoginLoadingState) {
                    CustomProgressIndicator.customProgressIndicator(
                      message: 'Загрузка...',
                    );
                  }

                  if (state is SuccessConfirmCodeState) {
                    SmartDialog.dismiss();

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HousingSearchScreen()),
                        (Route<dynamic> route) => false);
                  }

                  if (state is LoginErrorState) {
                    SmartDialog.dismiss();

                    Exceptions.showFlushbar(
                      state.error.message ?? '',
                      context: context,
                    );
                  }
                },
                child: CustomButton(
                  onTap: () {
                    showTimer.value = true;

                    bloc.add(ConfirmCodeEvent(
                      code: controller.text.isNotEmpty
                          ? int.parse(controller.text)
                          : 0,
                    ));
                  },
                  text: 'Подтвердить код',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
