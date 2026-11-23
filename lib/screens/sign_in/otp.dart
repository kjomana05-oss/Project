import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/widgets/custom_elevated_button.dart';

import '../../utils/resources/app_routes.dart' show AppRoutes;

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController otpController = TextEditingController();
  int remainingSeconds = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 55,
    height: 55,
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: AppColor.goldColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColor.blackColor, width: 3),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.goldColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter the code',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                    color: AppColor.blackColor,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  'An authentication code has been\nsent to your email',
                  style: TextStyle(
                    color: AppColor.grayColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height * 0.15),
                Pinput(
                  mainAxisAlignment: .spaceBetween,
                  length: 5,
                  controller: otpController,
                  defaultPinTheme: defaultPinTheme,

                  onCompleted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: height * 0.05),
                CustomElevatedButton(
                  text: "Verify",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.changePassword);
                    if (otpController.text.length == 5) {
                      String otp = otpController.text;
                      print(otp);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter the complete code'),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                Center(
                  child: TextButton(
                    onPressed: remainingSeconds == 0
                        ? () {
                            otpController.clear();

                            setState(() {
                              remainingSeconds = 59;
                            });

                            startTimer();
                          }
                        : null,
                    child: Text(
                      remainingSeconds > 0
                          ? 'Resend Code in 00:${remainingSeconds.toString().padLeft(2, '0')}'
                          : 'Resend Code',
                      style: TextStyle(
                        color: AppColor.grayColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
