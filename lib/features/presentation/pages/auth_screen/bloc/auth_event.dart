part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final int phoneNumber;

  const LoginEvent({required this.phoneNumber});
}

class ConfirmCodeEvent extends AuthEvent {
  final int code;

  const ConfirmCodeEvent({required this.code});
}
