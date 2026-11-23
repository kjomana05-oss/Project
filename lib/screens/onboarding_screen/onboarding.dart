import 'package:flutter/material.dart';
import 'package:project/utils/resources/app_color.dart';
import 'package:project/utils/resources/app_routes.dart';

import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentIndex < OnboardingModel.onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.welcomeRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final bool isLastPage =
        _currentIndex == OnboardingModel.onboardingPages.length - 1;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.goldColor,
      body: PageView.builder(
        controller: _pageController,
        itemCount: OnboardingModel.onboardingPages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final item = OnboardingModel.onboardingPages[index];

          return Column(
            children: [
              SizedBox(
                height: size.height * 0.48,
                width: double.infinity,
                child: Image.asset(item.image, fit: BoxFit.cover),
              ),

              Expanded(
                child: Transform.translate(
                  offset: Offset(0, -24),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24, 36, 24, 28),
                    decoration: BoxDecoration(
                      color: AppColor.goldColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(48),
                        topLeft: Radius.circular(48),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: AppColor.blackColor,
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            color: AppColor.blackColor,
                          ),
                        ),
                        const Spacer(),

                        // النقط (Dots Indicator)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            OnboardingModel.onboardingPages.length,
                            (dotIndex) {
                              final isActive = dotIndex == _currentIndex;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: isActive ? 9 : 7,
                                height: isActive ? 9 : 7,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isActive
                                      ? Colors.black
                                      : const Color(0xFFBDBDBD),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        if (!isLastPage)
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: _onNextPressed,
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          )
                        else
                          SizedBox(
                            width: double.infinity,
                            height: height * 0.04,
                            child: OutlinedButton(
                              onPressed: _onNextPressed,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Text(
                                'Get started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
