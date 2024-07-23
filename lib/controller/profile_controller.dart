import 'dart:io';

import 'package:active_app/core/class/api.dart';
import 'package:active_app/core/services/services.dart';
import 'package:get/get.dart';


abstract class ProfileController extends GetxController {
   void getProfileInfo() ;
}

class ProfileControllerImp extends ProfileController {
   MyServices services = Get.find();
    String name = "";
    String brithday = "";
    String emil = "";
    String language = "";
    String subscription = "";
    File? localImageFile;

   @override
  void onInit() async{
    getProfileInfo();
     if(services.sharedPreferences.getString("image") != null)
   {
     localImageFile =  await Api().getImage(services.sharedPreferences.getString("image")!);
   }
   update();
    super.onInit();
  }

  @override
  void getProfileInfo() {
    final sharedPrefs = services.sharedPreferences;
    // Use null-aware operators to handle potential null values
    name = sharedPrefs.getString("username") ?? "";
    brithday = sharedPrefs.getString("brithDay") ?? "26/5/2003";
    emil = sharedPrefs.getString("email") ?? "";
    language = sharedPrefs.getString("lang") ?? "";
    language = language == "ar" ? "عربي" : "Engilsh" ;
  }

}