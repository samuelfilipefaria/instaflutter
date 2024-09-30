import 'package:flutter/material.dart';
import 'package:instaflutter/styles/colors.dart';

class TextInput extends StatelessWidget {
  final String label;
  final bool autofocusEnabled;
  final bool hideText;
  final TextEditingController controller;

  const TextInput({super.key, required this.label, this.autofocusEnabled = false, this.hideText = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocusEnabled,
      obscureText: hideText,
      cursorColor: dark,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: dark),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primary),
        ),
        floatingLabelStyle: const TextStyle(color: dark)
      ),
    );
  }
}