import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/login_model.dart';
import '../../services/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      LoginModel loginModel = await LoginService().loginUser(
        email: email,
        password: password,
      );
      emit(LoginSuccess(loginModel));
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}
