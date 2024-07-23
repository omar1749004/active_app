import 'package:active_app/controller/training_controller.dart';
import 'package:active_app/core/constant/color.dart';
import 'package:active_app/feature/training/widget/record_sections.dart';
import 'package:active_app/feature/training/widget/recording_group_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>repetBottomSheet(TrainingControllerImp controller,){
 
    Get.bottomSheet(
                isScrollControlled: true,

                 Container(
    color: Colors.white,
      height: 600,
      child: Column(
        children: [
          TabBar(
            controller: controller.tabController,
            tabs:const [
              Tab(text: "تسجيل  المجموعات"),
              Tab(text: "المجموعات السابقة"),
            ],
            indicatorColor: ColorApp.kPrimaryColor,
            labelColor:  ColorApp.kPrimaryColor,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              controller.tabController.animateTo(index);
              }
            ,
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
              const  RecordingGroupsSection(),
               RecordSection(),
              
              ],
            ),
          ),
        ],
      ),
    )
              );
   return Future.value(true);
}
