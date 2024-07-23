import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/data/models/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      body:
          "استعد لتغيير حياتك الرياضية",
      image: ImageAsset.onboardingImageOne),
  OnBoardingModel(
      body:
          "احصل علي لياقة قوية وصحة مثالية",
      image: ImageAsset.onboardingImageTow),
  OnBoardingModel(
      body:
          "استعد لتجربة رياضية مذهلة",
      image: ImageAsset.onboardingImageThree),
 
];


List<String>  trainingLevel = ["مبتدئ", "متوسط" , "متقدم"] ;
List<String>  trainingtypes = ["Push Pull Leg",] ;