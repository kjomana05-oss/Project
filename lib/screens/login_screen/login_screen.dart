import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_assets.dart';
import 'package:project/utils/resources/app_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.goldColor,
      child: Stack(
        children: [
          Image.asset(AppAssets.backgroundCreateAcount),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Create account",
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
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
