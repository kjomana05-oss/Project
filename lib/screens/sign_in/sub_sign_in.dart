import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_text_field.dart';

class SubSignIn extends StatelessWidget {
  const SubSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.goldColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 75),
            Text(
              " Password Recovery",
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              " Please enter your email to reset your password",
              style: TextStyle(
                color: AppColor.grayColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 75),
            CustomTextField(hintText: "Password"),
            SizedBox(height: 35),
            CustomElevatedButton(text: "Reset password", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
