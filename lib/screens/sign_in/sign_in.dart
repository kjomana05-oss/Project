import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/utils/resources/app_routes.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
          children: [
            Align(
              alignment: .topLeft,
              child: Text(
                "please sign in",
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: height * 0.10),
            CustomTextField(hintText: "E-mail"),
            SizedBox(height: height * 0.02),
            CustomTextField(hintText: "Password"),
            SizedBox(height: height * 0.01),
            Align(
              alignment: .topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.subSignInRouteName);
                },
                child: Text(
                  " Forgot Password ?",
                  style: TextStyle(
                    color: AppColor.yellowColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            CustomElevatedButton(text: " Sign In", onPressed: () {}),

            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColor.blackColor, thickness: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColor.blackColor, thickness: 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                      context,
                      AppRoutes.loginRouteName,
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: AppColor.yellowColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
