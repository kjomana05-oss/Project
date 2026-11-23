import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.darkGreenColor,
        foregroundColor: AppColor.whiteColor,
        minimumSize: Size(double.infinity, 50),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
  }
}
