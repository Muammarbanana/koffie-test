import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koffie/core/constants/theme.dart';
import 'package:koffie/features/authentication/cubit/login/login_cubit.dart';
import 'package:koffie/features/authentication/views/register_page.dart';
import 'package:koffie/features/home/views/homepage.dart';
import 'package:koffie/generated/locale_keys.g.dart';

import '../../../core/widgets/custom_input_general.dart';
import '../widgets/show_dialog_success.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Form Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Form Key
  final _loginFormKey = GlobalKey<FormState>();

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

    Widget buildButtonLogin() {
      return BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_loginFormKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                    email: emailController.text,
                    password: passwordController.text);
              }
            },
            style: btnMainStyle,
            child: (state is LoginLoading)
                ? SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ))
                : Text(
                    LocaleKeys.onboarding_login.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
          ),
        );
      }, listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text(LocaleKeys.onboarding_loginSuccess.tr()),
            ),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else if (state is LoginFailed) {
          showDialogResponse(state.message, true);
        }
      });
    }

    Widget buildFormLogin() {
      return Form(
        key: _loginFormKey,
        child: Column(
          children: [
            Image.asset(
              'assets/images/koffie_logo.png',
              height: 300.w,
              width: 300.w,
            ),
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
              },
            ),
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
            buildButtonLogin(),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.onboarding_doesntHaveAccount.tr()),
                SizedBox(
                  width: 4.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    LocaleKeys.onboarding_register.tr(),
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
          padding: EdgeInsets.fromLTRB(25.w, 50.h, 25.w, 0),
          child: SingleChildScrollView(
            child: buildFormLogin(),
          ),
        ),
      ),
    );
  }
}
