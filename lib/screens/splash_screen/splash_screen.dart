import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_assets.dart';
import 'package:project/utils/resources/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(AppAssets.splashScreen, fit: BoxFit.cover),
    );
  }
}
