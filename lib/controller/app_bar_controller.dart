import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/services/services.dart';
import 'package:get/get.dart';

abstract class AppBarController extends GetxController{
  void  goToProfilePage();
}
 
class AppBarControllerImp extends AppBarController{
   MyServices services = Get.find();
  String  name = "" ;
  @override
  void onInit() {
   name = services.sharedPreferences.getString("username") ?? "" ;
    super.onInit();
  }
  @override
  void goToProfilePage() {
    Get.toNamed(AppRoute.profilePageId) ;
  }

}