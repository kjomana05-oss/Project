import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/utils/resources/app_routes.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    debugPrint('Signed In: $email | $password');
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter e-mail';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(text)) return 'Enter a valid e-mail';
    return null;
  }

  String? _validatePassword(String? value) {
    final text = value ?? '';
    if (text.isEmpty) return 'Please enter password';
    if (text.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

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
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                CustomTextField(
                  hintText: "E-mail",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                SizedBox(height: height * 0.02),
                CustomTextField(
                  hintText: "Password",
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  validator: _validatePassword,
                ),
                SizedBox(height: height * 0.01),
                Align(
                  alignment: .topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.subSignInRouteName);
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
                CustomElevatedButton(
                  text: " Sign In",
                  onPressed: _signIn,
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                            color: AppColor.blackColor, thickness: 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                        child: Divider(
                            color: AppColor.blackColor, thickness: 2),
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
        ),
      ),
    );
  }
}