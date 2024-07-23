import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/data/service/remote/auth/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';

abstract class SignUpController extends GetxController {
  signUp();
  gotologin();
  gotoVeryfyCodeSignUp();
  showPassword();
  changeIcone();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late FocusNode focusNode;
  late TextEditingController password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHidepass = true;
  IconData icone = CupertinoIcons.eye_slash;
  List data = [];
  //SocialControllerImp socialController = Get.find<SocialControllerImp>();
  StatusRequest statusRequs = StatusRequest.none;
  @override
  gotologin() {
    Get.offNamed(AppRoute.loginId);
  }

  @override
  signUp() async {
    if (formKey.currentState!.validate()) {
      statusRequest(StatusRequest.loading);
      // update();
      if (await checkinternet()) {
        var res = await SignupData().postData({
          "email": email.text,
          "password": password.text,
        });
        if (res["status"] == "fail") {
          statusRequest(StatusRequest.failure);
          globalSnakbar(title: "Waring", body: "Email Exists");
          // Get.defaultDialog(
          //     title: "Waring",
          //     middleText: "Email Exists",
          //     actions: [
          //       ElevatedButton(
          //           onPressed: () {
          //             Get.back();
          //           },
          //           child: Text("Ok"))
          //     ]);
        } else if (res["status"] == "success") {
          statusRequest(StatusRequest.success);
          // data.addAll();
          Get.offNamed(AppRoute.veryfyCodeSignUpId,
              arguments: {"email": email.text});
        } else if (res["status"] == "failure") {
          statusRequest(StatusRequest.failure);
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
    password = TextEditingController();
    super.onInit();
  }

  @override
  gotoVeryfyCodeSignUp() {
    Get.offNamed(AppRoute.veryfyCodeSignUpId);
  }

  @override
  showPassword() {
    isHidepass = !isHidepass;
    update();
  }

  // Functions to handle social sign in
  void signInWithGoogle() {
    // socialController.signInWithGoogle();
  }

  void signInWithFacebook() {
    //  socialController.signInWithFacebook();
  }

  @override
  changeIcone() {
    return icone = isHidepass ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
  }
}
