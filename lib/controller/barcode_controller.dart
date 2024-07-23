import 'package:active_app/core/class/json_manager.dart';
import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/trainer_model.dart';
import 'package:active_app/data/models/user_model.dart';
import 'package:active_app/data/service/remote/verfy_client_data.dart';
import 'package:get/get.dart';

import '../data/models/account_model.dart';

abstract class BarocdeController extends GetxController {
  void verfyBarcode();
  void selectCaptins(int id, int index);
  void goTobarcode();
}

class BarocdeControllerImp extends BarocdeController {
  late int barnchId;
  late String barcodeNum;
  late int captinId;
  late UserModel userModel;
  int captinIndex = -1;
  bool iscomplete = true;
  MyServices services = Get.find();
  List<TrainerModel> trainerModelList = [];
  List<Account> accountList = [];
  JsonManager jsonManager = JsonManager();
  StatusRequest statusRequs = StatusRequest.none;

  @override
  void onInit() {
    barnchId = Get.arguments["branchId"];
    captinId = Get.arguments["captinId"];
    super.onInit();
  }

  @override
  void verfyBarcode() async {
    statusRequest(StatusRequest.loading);
    // update();
    if (await checkinternet()) {
      var res = await VerfyClient().verfyCode({
        "branch_id": barnchId.toString(),
        "barcodeNum": barcodeNum,
        "captin_id": captinId.toString(),
      });
      if (res["status"] == "success") {
        statusRequest(StatusRequest.success);
        userModel = UserModel.fromJson(res["data"]);
        accountList = await jsonManager.getAccounts();
        if (accountList.isNotEmpty) {
          for (int x = 0; x < accountList.length; x++) {
            var response = await VerfyClient().accountRalated({
              "userId": userModel.usersId.toString(),
              "tableId": accountList[x].id,
              "tableName": accountList[x].table,
            });
            if (response["status"] == "success") {
              await jsonManager.removeAccount(accountList[x].id.toString());
            } else {
              iscomplete = false;
              statusRequest(StatusRequest.failure);
              globalSnakbar(title: "Waring", body: "Please try again later");
              break;
            }
          }
        }

        if (iscomplete) {
          await _saveUserDataToPreferences(userModel);
          Get.offAllNamed(AppRoute.physicalDetailsId);
        }
        statusRequest(StatusRequest.success);
        // data.addAll();
      } else if (res["status"] == "failure") {
        statusRequest(StatusRequest.failure);
        globalSnakbar(title: "Waring", body: "barcode wrong");
      }
    } else {
      statusRequest(StatusRequest.offlineFailure);
    }
    update();
  }

  @override
  void selectCaptins(int id, int index) {
    captinId = id;
    captinIndex = index;
    update();
  }

  @override
  void goTobarcode() {
    Get.toNamed(AppRoute.barcodeInputId, arguments: {
      "captinId": captinId,
      "branchId": barnchId,
    });
  }

Future<void> _saveUserDataToPreferences(UserModel userModel) async {
  final sharedPrefs = services.sharedPreferences;
  // Use null-aware operators to handle potential null values
  await sharedPrefs.setString("id", userModel.usersId?.toString() ?? '');
  await sharedPrefs.setString("username", userModel.usersName ?? '');
  await sharedPrefs.setString("phone", userModel.usersPhone ?? '');
  await sharedPrefs.setString("brithDay", userModel.usersDate ?? '');
  await sharedPrefs.setString("captin", userModel.usersCaptiantId?.toString() ?? '');
  await sharedPrefs.setString("barcodeId", userModel.barcodeId?.toString() ?? '');
  await sharedPrefs.setString("barcode", userModel.barcodeNumber?.toString() ?? '');
  await sharedPrefs.setString("image", userModel.usersImage ?? '');
  if(userModel.usersImage != null)
  {
    if(!await VerfyClient().foundImage(userModel.usersImage!))
    {
       VerfyClient().saveImage(userModel.usersImage!) ;
    }
    
  }
}
}
