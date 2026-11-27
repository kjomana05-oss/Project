import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_assets.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/utils/resources/app_routes.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final phone = _phoneController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    debugPrint(
      'Registered: $firstName $lastName | $phone | $email | $password',
    );
  }

  String? _validateName(String? value, String label) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter $label';
    if (text.length < 2) return '$label must be at least 2 characters';
    return null;
  }

  String? _validatePhone(String? value) {
    final text = value?.trim().replaceAll(' ', '') ?? '';
    if (text.isEmpty) return 'Please enter phone number';
    final phoneRegex = RegExp(r'^(?:\+?20)?0?1[0125][0-9]{8}$');
    if (!phoneRegex.hasMatch(text)) {
      return 'Enter a valid phone number';
    }
    return null;
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.backgroundCreateAcount,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Create account",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        AppAssets.feSektyImage,
                        width: width * 0.6,
                        height: height * 0.1,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      hintText: "First Name",
                      controller: _firstNameController,
                      keyboardType: TextInputType.name,
                      validator: (v) => _validateName(v, 'first name'),
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      hintText: "Last Name",
                      controller: _lastNameController,
                      keyboardType: TextInputType.name,
                      validator: (v) => _validateName(v, 'last name'),
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      hintText: "20+ Phone",
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: _validatePhone,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      hintText: "E-mail",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      hintText: "Password",
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 30),
                    CustomElevatedButton(
                      text: "Register",
                      onPressed: _register,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              context,
                              AppRoutes.signInRouteName,
                            );
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
          ),
        ],
      ),
    );
  }
}
