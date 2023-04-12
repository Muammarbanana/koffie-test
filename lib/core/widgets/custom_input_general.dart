import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/theme.dart';

class CustomInputGeneral extends StatelessWidget {
  const CustomInputGeneral({
    Key? key,
    required this.controller,
    required this.hint,
    this.inputType,
    this.inputFormatter,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatter;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: enabledTextFormStyle.copyWith(
        hintText: hint,
      ),
      keyboardType: inputType,
      inputFormatters: inputFormatter,
      validator: validator,
    );
  }
}
