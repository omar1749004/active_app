import 'dart:io';

import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';
import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/functions/upload_file.dart';
import 'package:active_app/core/localization/change_lacal.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/renew_model.dart';
import 'package:active_app/data/service/remote/profile_data.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  void getProfileInfo();
  void editImage();
  void chouseOptionIMage();
  void changeLnag(String lang);
  void changeSub(String sub);
}

class ProfileControllerImp extends ProfileController {
  MyServices services = Get.find();
  LocalController localController = Get.find();
  String name = "";
  String brithday = "";
  String emil = "";
  String? language;
  String subscription = "";
  File? localImageFile;
  File? uoloadFile;
  String? imageName;
  late int id;
  List<String> langList = ["English", "عربي"];
  List<String> subList = [];
  List<RenewModel> renewList = [];
  StatusRequest statusRequs = StatusRequest.none;

  @override
  void onInit() async {
    renewList = Get.arguments["renewList"];
    getProfileInfo();
    imageName = services.sharedPreferences.getString("image");
    if (imageName!.isNotEmpty) {
      localImageFile = await Api().getImage(imageName!);
    }
   

    update();
    super.onInit();
  }

  @override
  void getProfileInfo() {
    final sharedPrefs = services.sharedPreferences;
    // Use null-aware operators to handle potential null values
    name = sharedPrefs.getString("username") ?? "";
    brithday = sharedPrefs.getString("brithDay") ?? "26/5/2003";
    emil = sharedPrefs.getString("email") ?? "";
    language = sharedPrefs.getString("lang") ?? "";
    language = language == "ar" ? "عربي" : "English";
    id = sharedPrefs.getInt("renew")!;
    subscription = renewList
        .firstWhere((element) => element.renewalId == id)
        .subscriptionsName!;
    subList = renewList.map((e) => e.subscriptionsName!).toList();

    update();
  }

  @override
  void editImage() async {
    statusRequest(StatusRequest.loading);
    if (await checkinternet()) {
      var res = await ProfileData().editImage({
        "id": services.sharedPreferences.getString("id"),
        "oldimagename": services.sharedPreferences.getString("image")
      }, uoloadFile!);
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
        if (imageName!.isNotEmpty) {
          await Api()
              .deleteImage(imageName!);
        }
        localImageFile =
            await Api().downloadAndSaveImage(linkImageUpload, res["imageName"]);
        services.sharedPreferences.setString("image", res["imageName"]);
        localImageFile = uoloadFile;
        uoloadFile = null;

        statusRequest(StatusRequest.success);
      }
    } else {
      statusRequest(StatusRequest.offlineFailure);
    }
    update();
  }

  @override
  void chouseOptionIMage() {
    showBottonSheetGet(chouseImageCamera, chouseImageGallery);
  }

  chouseImageGallery() async {
    uoloadFile = await fileUploadGallery();
    if (uoloadFile != null) {
      editImage();
    }
  }

  chouseImageCamera() async {
    uoloadFile = await imageUploadCamera();
    if (uoloadFile != null) {
      editImage();
    }
  }

  @override
  void changeLnag(String lang) {
    lang = lang == "عربي" ? "ar" : "en";
    if (lang != services.sharedPreferences.getString("lang")) {
      localController.changeLang(lang);
    }
  }

  @override
  void changeSub(String sub) {
    id = renewList
        .firstWhere((element) => element.subscriptionsName == sub)
        .renewalId!;
    services.sharedPreferences.setInt("renew", id);
    subscription = sub;
    // update();
  }
}
