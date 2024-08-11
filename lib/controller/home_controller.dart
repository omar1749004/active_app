import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/renew_model.dart';
import 'package:active_app/data/service/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void view();
  void getPhysicalInfo();
  void goTobrnchDetails();
  int calculateDaysRemaining(DateTime? renewalEnd);
}

class HomeControllerImp extends HomeController {
  List<RenewModel> renewModelList = [];
  RenewModel? renewModel;
  late TextEditingController tall;
  late TextEditingController weight;
  late TextEditingController fat;
  late TextEditingController muscle;

  StatusRequest statusRequs = StatusRequest.none;
  MyServices services = Get.find();
  @override
  void onInit() {
    view();
    tall = TextEditingController();
    weight = TextEditingController();
    fat = TextEditingController();
    muscle = TextEditingController();
    getPhysicalInfo();
    super.onInit();
  }

  @override
  void view() async {
    // statusRequest(StatusRequest.loading);
    statusRequs = StatusRequest.loading;
    update();
    if (await checkinternet()) {
      var res = await HomeData()
          .view({"barcode": services.sharedPreferences.getString("barcode")});
      if (res["status"] == "success") {
        List data = res["renews"];
        renewModelList.addAll(data.map((e) => RenewModel.fromJson(e)));
        if (!renewModelList.any(((element) =>
            element.renewalId == services.sharedPreferences.getInt("renew")))) {
          services.sharedPreferences
              .setInt("renew", renewModelList[0].renewalId!);
          renewModel = renewModelList[0];
        } else {
          renewModel = renewModelList.firstWhere((element) =>
              element.renewalId == services.sharedPreferences.getInt("renew"));
        }
        statusRequs = StatusRequest.success;
        // statusRequest(StatusRequest.success);
      } else if (res["status"] == "fail") {
        globalSnakbar(title: "wring", body: "the renew is end");
        renewModel = RenewModel.fromJson(res["renews"]);
        renewModelList.add(renewModel!);
         services.sharedPreferences
              .setInt("renew", renewModel?.renewalId?? -1);
        statusRequs = StatusRequest.failure;
        //statusRequest(StatusRequest.failure);
      } else {
        statusRequs = StatusRequest.failure;
        //statusRequest(StatusRequest.failure);
      }
    } else {
      statusRequs = StatusRequest.offlineFailure;
      //statusRequest(StatusRequest.offlineFailure);
    }
    update();
  }

  @override
  void goTobrnchDetails() {
    Get.toNamed(AppRoute.branshDetailsId, arguments: {
      "branchModel": "branchModel",
      "images": "imageMap[branchModel.branchId]"
    });
  }

  @override
  void getPhysicalInfo() {
    final sharedPrefs = services.sharedPreferences;
    // Use null-aware operators to handle potential null values
    tall.text = sharedPrefs.getString("lenght")!;
    weight.text = sharedPrefs.getString("weight") ?? "?";
    muscle.text = sharedPrefs.getString("muscle") ?? "?";
    fat.text = sharedPrefs.getString("fat")!;
  }

  @override
  int calculateDaysRemaining(DateTime? renewalEnd) {
    if (renewalEnd == null) {
      return 0;
    }
    int daysRemaining = renewalEnd.difference(DateTime.now()).inDays;
    return daysRemaining < 0 ? 0 : daysRemaining;
  }
}
