import 'package:flutter/material.dart';
import 'package:project/screens/login_screen/login_screen.dart';
import 'package:project/screens/sign_in/sign_in.dart';
import 'package:project/screens/sign_in/sub_sign_in.dart';
import 'package:project/screens/splash_screen/splash_screen.dart';
import 'package:project/screens/welcome_screen/welcome_screen.dart';
import 'package:project/utils/resources/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRouteName,
      routes: {
        AppRoutes.splashRouteName: (context) => SplashScreen(),
        AppRoutes.welcomeRouteName: (context) => WelcomeScreen(),
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.signInRouteName: (context) => SignIn(),
        AppRoutes.subSignInRouteName: (context) => SubSignIn(),
      },
    );
  }
}
