import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/data/models/brach_model.dart';
import 'package:get/get.dart';

 abstract class BranchDetailsController extends GetxController {
   void selectImage(int index) ;
   void goToTrainerSelection();
}
class BranchDetailsControllerImp extends BranchDetailsController{
   int selectedImageIndex = 0;
   late BranchModel  branchModel  ;
   List<String> imagePaths = [] ;
   
   @override
  void onInit() {
   branchModel = Get.arguments["branchModel"] ;
   imagePaths = Get.arguments["images"] ;
    super.onInit();
  }

     @override
       void selectImage(int index) {
      selectedImageIndex = index;
      update() ;
  }
  String getSelectedImagePath(int index) {
  if (index >= 0 && index <= imagePaths.length) {
    return imagePaths[index];
  } else {
    return ImageAsset.branchImage; // Default image if index is out of range
  }
}
  //  String getSelectedImagePath(int index) {
  //   switch (index) {
  //     case 0:
  //       return ImageAsset.branchImage; 
  //     case 1:
  //       return ImageAsset.onboardingImageOne; 
  //     case 2:
  //       return ImageAsset.onboardingImageTow;
  //     default:
  //       return ImageAsset.onboardingImageThree;
  //   }
  // }

   @override
  void goToTrainerSelection() {
    Get.toNamed(AppRoute.trainerSelectionId,arguments: {
      "id" : branchModel.branchId,
    });
  }
}