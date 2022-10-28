part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class SuccessLoginState extends AuthState {
  final LoginModel model;

  const SuccessLoginState({required this.model});

  @override
  List<Object> get props => [model];
}

class SuccessConfirmCodeState extends AuthState {
  final ConfirmCodeModel model;

  const SuccessConfirmCodeState({required this.model});

  @override
  List<Object> get props => [model];
}

class LoginErrorState extends AuthState {
  final CatchException error;

  const LoginErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
