/* External dependencies */
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Local dependencies */
import 'package:kars_avia/features/data/datasourses/remote/catch_exception.dart';
import 'package:kars_avia/features/data/models/confirm_code_model.dart';
import 'package:kars_avia/features/data/models/login_model.dart';
import 'package:kars_avia/features/data/repositories/login_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    LoginRepository repository = LoginRepository();

    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());

        try {
          LoginModel model =
              await repository.login(phoneNumber: event.phoneNumber);

          emit(SuccessLoginState(model: model));
        } catch (e) {
          emit(LoginErrorState(error: CatchException.convertException(e)));
        }
      }

      if (event is ConfirmCodeEvent) {
        emit(LoginLoadingState());

        try {
          ConfirmCodeModel model =
              await repository.confirmCode(code: event.code);

          emit(SuccessConfirmCodeState(model: model));
        } catch (e) {
          emit(LoginErrorState(error: CatchException.convertException(e)));
        }
      }
    });
  }
}
