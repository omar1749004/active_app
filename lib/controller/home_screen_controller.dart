import 'dart:io';

import 'package:active_app/controller/home_controller.dart';
import 'package:active_app/core/class/api.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/feature/home/screen/home_page.dart';
import 'package:active_app/feature/nutrition/screen/add_males.dart';
import 'package:active_app/feature/nutrition/screen/daily_nutrition.dart';
import 'package:active_app/feature/offers/screen/plans.dart';
import 'package:active_app/feature/progress/screen/progress_level.dart';
import 'package:active_app/feature/progress/screen/trainer_progress_level.dart';
import 'package:active_app/feature/training/screen/add_traing.dart';
import 'package:active_app/feature/training/screen/training_week.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  void changePage(int i);
  Color changeColor(int i);
  void onLongPressEnd(int index);
  void onLongPress(int index);
  void goToProfilePage() ;
}

class HomeScreenControllerImp extends HomeScreenController {
  bool active = false;
  List<bool> isZoomed = List.filled(5, false);
  Color acivecolor = Colors.black;
  int currentPage = 0;
  HomeControllerImp homeController = Get.put(HomeControllerImp());
  File? localImageFile;
  MyServices services = Get.find();
  String  name = "" ;
  List<Widget> listPage = [
    const HomePage(title: "تفاصيل عنك",),
    const TrainingWeek(),
    const DailyNutrition(),
    const ProgressLevel(),
    const PlansPage(),
  ];
  List<Widget> listTrainerPage = [
    const HomePage(title: "تفاصيل عن المتدرب",),
    const AddTraining(),
    const AddMales(),
    const TrainerProgressLevel(),
  ];
  List<Map> bottomAppBar = [
    {"title": "الرئيسية", "icon": Icons.home},
    {"title": "التمرين", "icon": Icons.fitness_center},
    {"title": "التغذية", "icon": Icons.restaurant},
    {"title": "التقدم", "icon": CupertinoIcons.star_circle},
    {"title": "العروض", "icon": CupertinoIcons.money_dollar_circle},
  ];
  List<Map> bottomAppBarTrainer = [
    {"title": "الرئيسية", "icon": Icons.home},
    {"title": "اضافة تمرينة", "icon": Icons.fitness_center},
    {"title": "اضافة نظام غذائي", "icon": Icons.restaurant},
    {"title": "مستوي التقدم", "icon": CupertinoIcons.star_circle},
  ];

  
  @override
  void onInit() async{
   name = services.sharedPreferences.getString("username") ?? "" ;
   
   if(services.sharedPreferences.getString("image") != null)
   {
     localImageFile =  await Api().getImage(services.sharedPreferences.getString("image")!);
   }
   update();
    super.onInit();
  }
  @override
  void goToProfilePage() {
    Get.toNamed(AppRoute.profilePageId ,arguments: {"renewList" : homeController.renewModelList}) ;
  }

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  void onLongPressEnd(int index) {
    isZoomed[index] = false;
    update();
  }

  @override
  void onLongPress(int index) {
    isZoomed[index] = true;
    update();
  }

  @override
  changeColor(int i) {
    return i == currentPage ? ColorApp.kPrimaryColor : ColorApp.ashen;
  }
}
