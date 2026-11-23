import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColor.whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
