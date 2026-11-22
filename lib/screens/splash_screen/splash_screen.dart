import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(AppAssets.splashScreen, fit: BoxFit.cover),
    );
  }
}
