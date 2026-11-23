class OnboardingModel {
  final String image;
  final String title;
  final String description;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static const List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      image: 'assets/images/onboarding_1.png',
      title: 'Save Costs & Secure Your Trip',
      description:
          'Share your daily ride with university peers and save easily.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding_2.png',
      title: 'Secure & Full Verification',
      description:
          'Secure university email sign-up, with smart voice SOS for your safety all the way',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding_3.png',
      title: 'Quick & Easy Arrival',
      description:
          'Track your ride in real time, know your expected arrival time, and avoid traffic and waiting',
    ),
  ];
}
