import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ProgressLevelController extends GetxController
{
  void  change();
}
class ProgressLevelControllerImp extends ProgressLevelController
{
  late PageController pageController;
  int currentWiget = 0;
  @override
  change() {
    if(currentWiget >= 1){
      currentWiget = 0 ;
    }else{
       currentWiget++ ;
    }
         pageController.animateToPage(
      currentWiget, duration:const Duration(milliseconds: 500), curve: Curves.easeInOut);    
      update();
  }

  @override
  void onInit() {
    pageController =PageController();
    super.onInit();
  }
}