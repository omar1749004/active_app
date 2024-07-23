import 'package:active_app/core/constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find(); //علشان عاملين  put
  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("step") == "3")
    {
      return const RouteSettings(name: AppRoute.homeScreenId);
    }
   else if (myServices.sharedPreferences.getString("step") == "2") {
     return const RouteSettings(name: AppRoute.branshDetailsId);
    }
   else if (myServices.sharedPreferences.getString("step") == "1") {
     return const RouteSettings(name: AppRoute.socailId);
    } else
      {
        return null;
      }
  }
}
