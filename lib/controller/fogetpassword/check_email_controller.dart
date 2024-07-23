import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/data/service/remote/fogetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/checkinternet.dart';

abstract class CheckEmailController extends GetxController {
  checkemail();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StatusRequest statusRequs = StatusRequest.none;
  @override
  @override
  checkemail() async {
    if (formKey.currentState!.validate()) {
      statusRequest(StatusRequest.loading);
      if (await checkinternet()) {
        var res = await CheckEmailData().postData(
          email: email.text,
        );

        if (res["status"] == "fail") {
          statusRequest(StatusRequest.failure);
          globalSnakbar(title: "Waring", body: "Email Not Found") ;
          // Get.defaultDialog(
          //     title: "Waring",
          //     middleText: "Email Not Found",
          //     actions: [
          //       ElevatedButton(
          //           onPressed: () {
          //             Get.back();
          //           },
          //           child: const Text("Ok"))
          //     ]);
        } else {
           statusRequest(StatusRequest.success);
          Get.offNamed(AppRoute.verfyid, arguments: {"email": email.text});
        }
      } else {
        statusRequest(StatusRequest.offlineFailure);
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }
}
