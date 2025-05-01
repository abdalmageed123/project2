
import 'package:project2/core/constants/images.dart';
class OnboardingPageModel {
  final String image;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
final List<OnboardingPageModel> pages = [
  OnboardingPageModel(
    image: AppImage.b1, // ضع المسار الصحيح للصورة
    title: '2',
    description: '3',
  ),
  OnboardingPageModel(
    image: AppImage.b2 ,
    title: '4',
    description: '5',
  ),
  OnboardingPageModel(
    image:  AppImage.b3, 
    title: '6',
    description: '7',
  ),
];
