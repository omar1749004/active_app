import 'package:active_app/controller/home_screen_controller.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/feature/home/widget/custom_app_bar.dart';
import 'package:active_app/feature/home/widget/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((controller) => Scaffold(
            extendBody: true,
            appBar: CustomAppBar
            (onTapProfile: () => Get.toNamed(AppRoute.profilePageId),
            onTapAbout: () => Get.toNamed(AppRoute.aboutUsId),
            onTapNotifi: () => Get.toNamed(AppRoute.notificationId),
            ),
            bottomNavigationBar:const CustomBottomAppBar(true),
            body:  controller.listPage.elementAt(controller.currentPage),
          )),
          
    );
  }
}