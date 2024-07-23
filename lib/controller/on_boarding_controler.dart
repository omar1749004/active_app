import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/service/static/static.dart';
//import 'package:active_app/views/screen/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class OnBoeardingController extends GetxController
{
   next();
   onChanged(int index);
}
class OnBoardingControllerImp extends OnBoeardingController
{
  late PageController pageController;
  int currentPage =0;
  MyServices myServices = Get.find();  //علشان عاملين  put
  @override
  next() {
    currentPage ++;
    if(currentPage> onBoardingList.length-1)
    {
      
     myServices.sharedPreferences.setString("step", "1"); //for language
     
     Get.offAllNamed(AppRoute.socailId);
    }
    else{
         pageController.animateToPage(
      currentPage, duration:const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
    
      
  }

  @override
  onChanged(int index) {
    currentPage=index;
    update();
  }
  @override
  void onInit() {
    pageController =PageController();
    super.onInit();
  }
}