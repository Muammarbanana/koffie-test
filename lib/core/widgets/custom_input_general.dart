import 'package:flutter/material.dart';

import '../constants/theme.dart';

class CustomInputGeneral extends StatelessWidget {
  const CustomInputGeneral({
    Key? key,
    required this.controller,
    required this.hint,
    this.inputType,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: enabledTextFormStyle.copyWith(
        hintText: hint,
      ),
      keyboardType: inputType,
    );
  }
}
