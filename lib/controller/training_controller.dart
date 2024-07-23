import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TrainingController extends GetxController
{
   void addSet() ;
   void removeSet() ;
}

class TrainingControllerImp extends TrainingController  with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int sets = 5;
   List<TextEditingController> weightControllers = [];
   List<TextEditingController> repsControllers  =[];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    for (int i = 0; i < sets; i++) {
      weightControllers.add(TextEditingController());
      repsControllers.add(TextEditingController());
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
  
  @override
  void addSet() {
    sets += 1;
      weightControllers.add(TextEditingController());
      repsControllers.add(TextEditingController());
      update();
  }
  
  @override
  void removeSet() {
    sets -= 1;
        weightControllers.removeLast();
        repsControllers.removeLast();
         update();
  }
}