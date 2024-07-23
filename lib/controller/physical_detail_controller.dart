import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/service/remote/physical_info_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PhysicalDetailsController extends GetxController {
  void addDetails();
}

class PhysicalDetailsControllerImp extends PhysicalDetailsController {
  MyServices services = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StatusRequest statusRequs = StatusRequest.none;
  late TextEditingController tall;
  late TextEditingController weight;
  late TextEditingController fat;
  late TextEditingController muscle;

  @override
  void onInit() {
    tall = TextEditingController();
    weight = TextEditingController();
    fat = TextEditingController();
    muscle = TextEditingController();

    super.onInit();
  }

  @override
  void addDetails() async {
    if (formKey.currentState!.validate()) {
      statusRequest(StatusRequest.loading);
      // update();
      if (await checkinternet()) {
        var res = await PhysicalInfoData().add({
          'userid': services.sharedPreferences.getString("id"),
          'lenght': tall.text,
          'weight': weight.text,
          'musclePercentage': muscle.text.isEmpty ? "0": muscle.text,
          'fatPercentage': fat.text.isEmpty ? "0" : fat.text,
        });

        if (res["status"] == "failure") {
          statusRequest(StatusRequest.failure);
          globalSnakbar(title: "Waring", body: "Please try again later");
          // Get.defaultDialog(
          //     title: "Waring",
          //     middleText: "Email Or phone already Exists",
          //     actions: [
          //       ElevatedButton(
          //           onPressed: () {
          //             Get.back();
          //           },
          //           child: Text("Ok"))
          //     ]);
        } else {
          await _saveUserPhysicalToPreferences() ;
          services.sharedPreferences.setString("step", "3");
          statusRequest(StatusRequest.success);

          // data.addAll();
          Get.offAllNamed(AppRoute.homeScreenId);
        }
      } else {
        statusRequest(StatusRequest.offlineFailure);
      }
    }

    update();
  }

  Future<void> _saveUserPhysicalToPreferences() async {
  final sharedPrefs = services.sharedPreferences;
  // Use null-aware operators to handle potential null values
  await sharedPrefs.setString("lenght", tall.text);
  await sharedPrefs.setString("weight", weight.text);
  await sharedPrefs.setString("muscle", muscle.text);
  await sharedPrefs.setString("fat", fat.text);
  
}
}
