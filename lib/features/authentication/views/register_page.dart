import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koffie/core/widgets/custom_input_general.dart';
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

  @override
  Widget build(BuildContext context) {
    Widget buildRegisterForm() {
      return Column(
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: btnMainStyle,
              child: Text(
                LocaleKeys.onboarding_register.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
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
