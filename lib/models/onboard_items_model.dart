class OnboardItems {
  final String svgAsset;
  final String title;
  final String message;

  OnboardItems({
    required this.svgAsset,
    required this.title,
    required this.message,
  });
}

// OnbordItems 
List<OnboardItems> onboardingDataList = [
  OnboardItems(
    svgAsset: 'assets/svg/signup_svg.svg',
    title: 'Welcome to MyApp',
    message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ),
  OnboardItems(
    svgAsset: 'assets/svg/signup_svg.svg',
    title: 'Discover Features',
    message: 'Explore amazing features that make our app unique.',
  ),
  OnboardItems(
    svgAsset: 'assets/svg/signup_svg.svg',
    title: 'Get Started',
    message: 'Join us now and enjoy a world of possibilities.',
  ),
];
