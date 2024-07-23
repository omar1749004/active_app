import 'dart:async';

import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/data/service/remote/auth/verfycode.dart';
import 'package:active_app/data/service/remote/fogetpassword/verfycode_foget.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';

abstract class VeryfyCodeCotoller extends GetxController {
  gotoResetPass();
  void startcounter();
}

class VeryfyCodeCotollerImp extends VeryfyCodeCotoller {
  String? email;
  late String vrifiCode;
  StatusRequest statusRequs = StatusRequest.none;
  int counter = 5;
  bool endCounter = false;

  @override
  gotoResetPass() async {
    if (await checkinternet()) {
      statusRequest(StatusRequest.loading);
      var res = await VerfyCodeForgetData()
          .postData(email: email!, verfycode: vrifiCode);
      if (res["status"] == "fail") {
        statusRequest(StatusRequest.failure);
        globalSnakbar(title: "Waring", body: "Verfy Code Not Correct");
        // Get.defaultDialog(
        //     title: "Waring",
        //     middleText: "Verfy Code Not Correct",
        //     actions: [
        //       ElevatedButton(
        //           onPressed: () {
        //             Get.back();
        //           },
        //           child: Text("Ok"))
        //     ]);
      } else {
        statusRequest(StatusRequest.success);

        // data.addAll();
        Get.offNamed(AppRoute.resetId, arguments: {"email": email});
      }
    }
    update();
  }

  resend() {
    VerfyCodeData().resendData(email: email!);
    endCounter = false;
    update();
    counter = 5;
    startcounter();
  }

  @override
  void startcounter() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 1) {
        counter--;
        update();
      } else {
        endCounter = true;
        timer.cancel();
        update();
      }
    });
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    startcounter();
    super.onInit();
  }
}
