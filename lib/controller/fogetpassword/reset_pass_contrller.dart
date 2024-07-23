import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/data/service/remote/fogetpassword/resete_pass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';

abstract class ResetPassController extends GetxController {
  resetPassword();
  void showPassword(int numberOfForm);
  IconData changeIcone2();
  IconData changeIcone1();
}

class ResetPassControllerImp extends ResetPassController {
  late TextEditingController password;
  late TextEditingController repassword;
  bool isHidepass1 = true;
  bool isHidepass2 = true;
  StatusRequest statusRequs = StatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  @override
  @override
  resetPassword() async {
    if (formKey.currentState!.validate()) {
      if (password.text != repassword.text) {
        globalSnakbar(title: "Waring", body: "Password Not Match");
        //  Get.defaultDialog(
        //  title :"Waring",
        //   middleText: "Password Not Match",actions: [
        // ElevatedButton(onPressed: (){
        //   Get.back();
        // }, child: Text("Ok")) ]
        //  );
      } else {
        statusRequest(StatusRequest.loading);
        if (await checkinternet()) {
          var res = await ResetPasswordData().postData(
            password: password.text,
            email: email!,
          );

          if (res["status"] == "fail") {
            statusRequest(StatusRequest.failure);
            globalSnakbar(title: "Waring", body: "Please Try Agine");
            // Get.defaultDialog(
            //     title: "Waring",
            //     middleText: "Please Try Agine",
            //     actions: [
            //       ElevatedButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           child: Text("Ok"))
            //     ]);
          } else {
            statusRequest(StatusRequest.success);
            Get.offNamed(AppRoute.successResetId);
          }
        } else {
          statusRequs = StatusRequest.offlineFailure;
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    // email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void showPassword(int numberOfForm) {
    if (numberOfForm == 1) {
      isHidepass1 = !isHidepass1;
    } else if (numberOfForm == 2) {
      isHidepass2 = !isHidepass2;
    }
    update();
  }

  @override
  IconData changeIcone1() {
    return isHidepass1 ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
  }

  @override
  IconData changeIcone2() {
    return isHidepass2 ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
  }
}
