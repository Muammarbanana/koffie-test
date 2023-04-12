import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:koffie/features/authentication/services/register_service.dart';

import '../../models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register({
    required String email,
    required String phone,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      RegisterModel registerModel = await RegisterService().registerUser(
        email: email,
        phone: phone,
        firstName: firstName,
        lastName: lastName,
        password: password,
      );
      emit(RegisterSuccess(registerModel));
    } catch (e) {
      emit(RegisterFailed(e.toString()));
    }
  }
}
