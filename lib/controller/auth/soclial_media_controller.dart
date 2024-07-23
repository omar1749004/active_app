import 'package:active_app/core/class/auth_result.dart';
import 'package:active_app/core/class/json_manager.dart';
import 'package:active_app/core/class/social_medi_auth.dart';
import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/account_model.dart';
import 'package:active_app/data/service/remote/auth/socila_login.dart';
import 'package:get/get.dart';

abstract class SocialController extends GetxController {
  gotologin();
  gotosignup();
}

class SocialControllerImp extends SocialController {
  StatusRequest statusRequs = StatusRequest.none;
  AuthResult result = AuthResult.non;
  final SocialMediaAuth socialMediaAuth = SocialMediaAuth();
  MyServices services = Get.find();
  final jsonManager = JsonManager();
  List<Account> accountList = [];

  void signInWithGoogle() async {
    socialMediaAuth.signOut();
    statusRequest(StatusRequest.loading);
    if (await checkinternet()) {
      result = await socialMediaAuth.signInWithGoogle();
      if (result == AuthResult.success) {
        var res = await SocialLoginData().socialLogIn({
          "provider": "google",
          "provider_id": socialMediaAuth.userId,
          "email": socialMediaAuth.userEmail
        });
        if (res["status"] == "success") {
          services.sharedPreferences.setString("step", "2");
          services.sharedPreferences.setString("email", socialMediaAuth.userEmail!);
          accountList = await jsonManager.getAccounts();
            if(!accountList.any((element) => element.id == res["data"]))
            {
               await jsonManager.addAccount(
                Account(id: res["data"].toString(), table: "social"));
            }
          statusRequest(StatusRequest.success);

          Get.delete<SocialControllerImp>();
          Get.offAllNamed(AppRoute.physicalDetailsId);
          //////////////////////////////
        } else {
///////////////////////////////////////////////////
        }
        socialMediaAuth.signOut();
      } else if (result == AuthResult.cancelled) {
        statusRequest(StatusRequest.none);
        globalSnakbar(
            title: "Cancelled",
            body: 'Google sign-in was cancelled by the user');
      } else {
        statusRequest(StatusRequest.failure);
        globalSnakbar(title: "Error", body: 'Failed to sign in with Google');
      }
    } else {
      statusRequest(StatusRequest.offlineFailure);
    }
  }

  void signInWithFacebook() async {
    statusRequest(StatusRequest.loading);
    result = await socialMediaAuth.signInWithFacebook(Get.context!);
    if (result == AuthResult.success) {
      var res = await SocialLoginData().socialLogIn({
        "provider": "facebook",
        "provider_id": socialMediaAuth.userId,
        "email": socialMediaAuth.userEmail
      });
      if (res["status"] == "success") {
         await jsonManager
              .addAccount(Account(id: res["data"].toString(), table: "social"));
        services.sharedPreferences.setString("step", "2");
        services.sharedPreferences.setString("email", socialMediaAuth.userEmail!);
        statusRequest(StatusRequest.success);
        Get.delete<SocialControllerImp>();
        Get.offAllNamed(AppRoute.physicalDetailsId);
        //////////////////////////
      } else {
        //////////////////////////
        print("erore");
      }
      socialMediaAuth.signOut();
    } else if (result == AuthResult.cancelled) {
      statusRequest(StatusRequest.none);
      globalSnakbar(
          title: "Cancelled",
          body: 'Facebook sign-in was cancelled by the user');
    } else {
      statusRequest(StatusRequest.failure);
      Get.snackbar('Error', 'Failed to sign in with Facebook');
    }
  }

  @override
  gotosignup() {
    Get.toNamed(AppRoute.signUpId);
    //  Get.delete<SocialControllerImp>();
  }

  @override
  gotologin() {
    Get.toNamed(AppRoute.loginId);
    // Get.delete<SocialControllerImp>();
  }
}
