part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterModel registerModel;
  RegisterSuccess(this.registerModel);

  @override
  List<Object> get props => [registerModel];
}

class RegisterFailed extends RegisterState {
  String message;
  RegisterFailed(this.message);

  @override
  List<Object> get props => [message];
}
