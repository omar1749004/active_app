import 'package:active_app/core/constant/app_route.dart';
import 'package:get/get.dart';




abstract class SuccessSignupController extends GetxController
{
  
  gotologin();
}
class SuccessSignupControllerImp extends SuccessSignupController
{
  @override
  gotologin() {
    Get.offAllNamed(AppRoute.loginId);
  }

 

 

}