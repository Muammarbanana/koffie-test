part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginModel loginModel;
  LoginSuccess(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}

class LoginFailed extends LoginState {
  String message;
  LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}
