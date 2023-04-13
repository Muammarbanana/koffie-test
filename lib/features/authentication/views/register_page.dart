import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koffie/core/widgets/custom_input_general.dart';
import 'package:koffie/features/authentication/cubit/register/register_cubit.dart';
import 'package:koffie/features/authentication/widgets/show_dialog_success.dart';
import 'package:koffie/generated/locale_keys.g.dart';

import '../../../core/constants/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text Form Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Form Key
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> showDialogResponse(String message, bool isFail) async {
      showDialog(
        context: context,
        builder: (BuildContext context) => ShowDialogResponse(
          message: message,
          isFail: isFail,
        ),
      );
    }

    Widget buildButtonRegister() {
      return BlocConsumer<RegisterCubit, RegisterState>(
          builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_registerFormKey.currentState!.validate()) {
                context.read<RegisterCubit>().register(
                      email: emailController.text,
                      phone: phoneController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      password: passwordController.text,
                    );
              }
            },
            style: btnMainStyle,
            child: (state is RegisterLoading)
                ? SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ))
                : Text(
                    LocaleKeys.onboarding_register.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
          ),
        );
      }, listener: (context, state) {
        if (state is RegisterSuccess) {
          emailController.clear();
          firstNameController.clear();
          lastNameController.clear();
          passwordController.clear();
          phoneController.clear();
          showDialogResponse(state.registerModel.status.keterangan, false);
        } else if (state is RegisterFailed) {
          showDialogResponse(state.message, true);
        }
      });
    }

    Widget buildRegisterForm() {
      return Form(
        key: _registerFormKey,
        child: Column(
          children: [
            Text(
              LocaleKeys.onboarding_register.tr(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 36.sp,
              ),
            ),
            SizedBox(height: 8.h),
            CustomInputGeneral(
                controller: emailController,
                hint: LocaleKeys.onboarding_pleaseInputYourEmail.tr(),
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.onboarding_thisFieldRequired.tr();
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return LocaleKeys.onboarding_invalidEmailFormat.tr();
                  }
                  return null;
                }),
            SizedBox(height: 8.h),
            CustomInputGeneral(
                controller: phoneController,
                hint: LocaleKeys.onboarding_pleaseInputYourPhone.tr(),
                inputType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.onboarding_thisFieldRequired.tr();
                  }
                  return null;
                }),
            SizedBox(height: 8.h),
            CustomInputGeneral(
                controller: firstNameController,
                hint: LocaleKeys.onboarding_pleaseInputYourFirstName.tr(),
                inputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.onboarding_thisFieldRequired.tr();
                  }
                  return null;
                }),
            SizedBox(height: 8.h),
            CustomInputGeneral(
                controller: lastNameController,
                hint: LocaleKeys.onboarding_pleaseInputYourLastName.tr(),
                inputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.onboarding_thisFieldRequired.tr();
                  }
                  return null;
                }),
            SizedBox(height: 8.h),
            CustomInputGeneral(
                controller: passwordController,
                hint: LocaleKeys.onboarding_pleaseInputPassword.tr(),
                inputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.onboarding_thisFieldRequired.tr();
                  }
                  return null;
                }),
            SizedBox(height: 8.h),
            buildButtonRegister(),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.onboarding_alreadyHaveAccount.tr()),
                SizedBox(
                  width: 4.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    LocaleKeys.onboarding_login.tr(),
                    style: const TextStyle(color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(25.w, 25.h, 25.w, 20.h),
          child: SingleChildScrollView(
            child: buildRegisterForm(),
          ),
        ),
      ),
    );
  }
}
