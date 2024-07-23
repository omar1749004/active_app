import 'package:active_app/api_link.dart';
import 'package:active_app/controller/auth/finger_print_controller.dart';
import 'package:active_app/controller/auth/soclial_media_controller.dart';
import 'package:active_app/core/class/json_manager.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/account_model.dart';
import 'package:active_app/data/service/remote/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';

abstract class LoginController extends PrintFinfgerControllerImp {
  login();
  gotosignup();
  gotocheckEmail();
  showPassword();
  changeIcone();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isHidepass = true;
  IconData icone = CupertinoIcons.eye_slash;
  List<Account> accountList = [];
  StatusRequest statusRequs = StatusRequest.none;
  MyServices services = Get.find();
  SocialControllerImp socialController = Get.find();
  final jsonManger = JsonManager();

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequest(StatusRequest.loading);
      update();
      if (await checkinternet()) {
        var res = await LoginData()
            .postData(email: email.text, password: password.text);
        if (res["status"] == "failure") {
          statusRequest(StatusRequest.failure);
          globalSnakbar(title: "Waring", body: "Email Or Passowrd Not Correct");
          // Get.defaultDialog(
          //     title: "Waring",
          //     middleText: "Email Or Passowrd Not Correct",
          //     actions: [
          //       ElevatedButton(
          //           onPressed: () {
          //             Get.back();
          //           },
          //           child: Text("Ok"))
          //     ]);
        } else if (res["status"] == "success") {
          Map data = res["data"][0];
          if (data["email_approve"] == 1) {
            accountList = await jsonManger.getAccounts();
            if(!accountList.any((element) => element.id == data["email_id"]))
            {
               await jsonManger.addAccount(
                Account(id: data["email_id"].toString(), table: "email"));
            }
            
            // services.sharedPreferences
            //     .setString("id", data["users_id"].toString());

            // services.sharedPreferences
            //     .setString("username", data["users_name"]);
            services.sharedPreferences.setString("email", data["email"]);
            // services.sharedPreferences.setString("phone", data["users_phone"]);
            services.sharedPreferences.setString("step", "2");

            // FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic("users${services.sharedPreferences.getString("id")}");

            statusRequest(StatusRequest.success);
            Get.delete<SocialControllerImp>();
            Get.offAllNamed(AppRoute.branshSelectionId);
          } else {
            Get.offNamed(linkVerfyBarcode, arguments: {"email": email.text});
          }
        }
      } else {
        statusRequest(StatusRequest.offlineFailure);
      }
    }
    update();
  }

  @override
  gotosignup() {
    Get.offNamed(AppRoute.signUpId);
    Get.delete<LoginControllerImp>();
  }

  @override
  void onInit()  {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  gotocheckEmail() {
    Get.toNamed(AppRoute.checkEmailId);
    Get.delete<LoginControllerImp>();
  }

  // Functions to handle social sign in
  void signInWithGoogle() {
    socialController.signInWithGoogle();
  }

  void signInWithFacebook() {
    socialController.signInWithFacebook();
  }

  @override
  showPassword() {
    isHidepass = !isHidepass;
    update();
  }

  @override
  changeIcone() {
    update();
    return isHidepass ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
  }
}
