import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/app_theme.dart';
//import 'package:active_app/core/functions/fcmconfig.dart';
import 'package:active_app/core/services/services.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  int select = 0;
  ThemeData apptheme = themeEnglish;
  MyServices myServices = Get.find();

  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    apptheme = languageCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }
  // requestPrimationLocation()async{
  //    bool serviceEnabled;
  // LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();

  // if (!serviceEnabled) {
  //   return Get.snackbar("woring", "Please open Location services");
  // }
  // permission = await Geolocator.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  // }
  // if (permission == LocationPermission.denied){
  //    return Get.snackbar("woring", "Please give app primation to access Location services");
  // }
  // if (permission == LocationPermission.deniedForever) {
  //   return Future.error(
  //    " Not Can't used App whithout Location ");
  // }
  // }
  @override
  void onInit() {
    //  requestPrimationLocation();
    //  fcmconfig();
    //s  requestPrimationNotification();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      apptheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      apptheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

  void selectLang(int selectLang) {
    select = selectLang;
    update();
  }

  void gotoOnboarding() {
      if(select == 1){
       changeLang("ar") ;
      }else{
        changeLang("en") ;
      }
        Get.offNamed(AppRoute.onboardingId);
  }
}
