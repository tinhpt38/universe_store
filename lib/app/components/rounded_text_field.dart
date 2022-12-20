import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../values/colors.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.password = false,
    this.hintText = '',
  });
  final TextEditingController controller;
  final TextInputType inputType;
  final bool password;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: password,
      controller: controller,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
          fillColor: AppColors.foreground,
          hintText: hintText,
          filled: true,
          contentPadding: const EdgeInsets.all(24),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(90))),
    );
  }
}
