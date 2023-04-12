import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koffie/core/constants/theme.dart';
import 'package:koffie/features/authentication/views/register_page.dart';
import 'package:koffie/generated/locale_keys.g.dart';

import '../../../core/widgets/custom_input_general.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Form Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget buildFormLogin() {
    return Column(
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
        ),
        SizedBox(height: 8.h),
        CustomInputGeneral(
          controller: passwordController,
          hint: LocaleKeys.onboarding_pleaseInputPassword.tr(),
          inputType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: btnMainStyle,
            child: Text(
              LocaleKeys.onboarding_login.tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
