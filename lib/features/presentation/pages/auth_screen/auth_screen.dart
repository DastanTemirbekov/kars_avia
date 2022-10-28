/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/constants/text_helper.dart';
import 'package:kars_avia/features/data/constants/theme_helper.dart';
import 'package:kars_avia/features/presentation/pages/auth_screen/bloc/auth_bloc.dart';
import 'package:kars_avia/features/presentation/pages/auth_screen/pin_code_screen.dart';
import 'package:kars_avia/features/presentation/widgets/custom_button.dart';
import 'package:kars_avia/features/presentation/widgets/custom_progress_indicator.dart';
import 'package:kars_avia/features/presentation/widgets/custom_textfield.dart';
import 'package:kars_avia/features/presentation/widgets/flushbar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController controller = TextEditingController();
  late AuthBloc bloc;
  late int code;

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
                'Укажите Ваш номер телефона',
                style: TextHelper.sf13bold,
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                controller: controller,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.h),
              Text(
                'Мы направим Вам SMS-сообщение, чтобы подтвердить номер телефона. Это бесплатно.',
                style: TextHelper.sf12normal.copyWith(color: ThemeHelper.grey),
              ),
              SizedBox(height: 32.h),
              BlocListener<AuthBloc, AuthState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is LoginLoadingState) {
                    CustomProgressIndicator.customProgressIndicator(
                      message: 'Загрузка...',
                    );
                  }

                  if (state is SuccessLoginState) {
                    SmartDialog.dismiss();

                    code = state.model.code ?? 0;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PinCodeScreen(code: code)));
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
                    bloc.add(LoginEvent(phoneNumber: int.parse(controller.text)));
                  },
                  text: 'Получить код ',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
