import '../constants/image_urls.dart';

class OnboardingItem {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

List<OnboardingItem> onboardingItems = [
  OnboardingItem(
    imageUrl: ImageUrls.onboardingImage1,
    title: "Welcome",
    description: "Discover amazing features in our app.",
  ),
  OnboardingItem(
    imageUrl: ImageUrls.onboardingImage2,
    title: "Connect",
    description: "Connect with people and share your moments.",
  ),
  OnboardingItem(
    imageUrl: ImageUrls.onboardingImage3,
    title: "Enjoy",
    description: "Enjoy a seamless experience anytime, anywhere.",
  ),
];
