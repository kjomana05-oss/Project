import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_assets.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/utils/resources/app_routes.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      backgroundColor: AppColor.goldColor,
      body: Stack(
        fit: StackFit.expand, // عشان صورة الخلفية تملى الشاشة كلها
        children: [
          Image.asset(AppAssets.backgroundCreateAcount, fit: BoxFit.cover),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create account",
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                  const CustomTextField(hintText: "First Name"),
                  const CustomTextField(hintText: "Last Name"),
                  const CustomTextField(hintText: "20+ Phone"),
                  const CustomTextField(hintText: "E-mail "),
                  const CustomTextField(hintText: "Password"),
                  const SizedBox(height: 30),
                  CustomElevatedButton(text: "Register", onPressed: () {}),

                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Have account?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.signInRouteName);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: AppColor.yellowColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
