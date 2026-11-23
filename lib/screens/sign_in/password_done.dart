import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_assets.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/utils/resources/app_routes.dart';
import 'package:project/widgets/custom_elevated_button.dart';

class PasswordDone extends StatelessWidget {
  const PasswordDone({super.key});

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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.1),
              Image.asset(
                AppAssets.doneImage,
                width: width * 0.7,
                height: height * 0.2,
                fit: BoxFit.contain,
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Password has been\nchanged",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor,
                ),
              ),
              SizedBox(height: height * 0.04),
              CustomElevatedButton(text: "Back to Login", onPressed: () {
                Navigator.popAndPushNamed(context, AppRoutes.signInRouteName);
              }),
              SizedBox(height: height * 0.02),
              Text(
                "Don't worry we `ll let  you know if there`s\na problem with your account ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.grayColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
