import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/utils/resources/app_routes.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_text_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
            SizedBox(height: height * 0.07),
            Text(
              " Change Password",
              style: TextStyle(
                color: AppColor.blackColor,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height * 0.04),
            CustomTextField(hintText: "New password"),
            SizedBox(height: height * 0.02),
            CustomTextField(hintText: "Confirm password"),
            SizedBox(height: height * 0.03),
            CustomElevatedButton(
              text: "Yes, Send code",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.passwordDone);
              },
            ),
          ],
        ),
      ),
    );
  }
}
