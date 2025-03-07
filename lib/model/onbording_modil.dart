import 'package:bazilbas/core/image_app.dart';
import 'package:bazilbas/data/onbording_data.dart';

OnboardingItems onbordingItems = OnboardingItems();

class OnboardingItems {
  List<OnboardingData> onbordingItems = [
    // 1- The best doctors
    OnboardingData(
      titel: "Shop online",
      description: "Shop from your place at any time and with ease",
      image: imageApp.onbordindImage1,
    ),

    // Complete care
    OnboardingData(
      titel: "Delivery to anywhere",
      description: "Your order will reach you anywhere as quickly as possible",
      image: imageApp.onbordindImage2,
    ),

    // Complete test
    OnboardingData(
      titel: "Best prices",
      description: "Huge discounts of up to 70% with unbeatable prices",
      image: imageApp.onbordindImage3,
    ),
    OnboardingData(
      titel: "Shop safely",
      description:
          "The best place to shop for women's clothes and personal belongings",
      image: imageApp.onbordindImage4,
    ),
  ];
}
