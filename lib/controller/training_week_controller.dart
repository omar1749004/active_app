import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/core/functions/handle_easy_loasing.dart';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/training_day_model.dart';
import 'package:active_app/data/service/remote/client_training.dart';
import 'package:get/get.dart';

abstract class TrainingWeekController extends GetxController {
  void view();
  String getDayName(int dayNumber);
  void gotoTrainingDay(int trainingDayId, int index);
}

class TrainingWeekControllerImp extends TrainingWeekController {
  StatusRequest statusRequs = StatusRequest.none;
  MyServices services = Get.find();
  late String id;
  Map? weekData;
  int isComplete = 0;
  int days = 0;
  List<TrainingDayModel> trainingDayModellList = [];

  @override
  void onInit() {
    id = services.sharedPreferences.getString("id")!;
    view();
    super.onInit();
  }

  @override
  void view() async {
    statusRequest(StatusRequest.loading);
    // statusRequs = StatusRequest.loading;
    update();
    if (await checkinternet()) {
      var res = await ClientTrainingData().weekCliantView({"usersid": "4"});
      if (res["status"] == "success") {
        List data = res["data"];
        weekData = res["week"];
        isComplete = weekData!["is_completed"];
        trainingDayModellList
            .addAll(data.map((e) => TrainingDayModel.fromJson(e)));
        if (services.sharedPreferences.getString("weekId") !=
            weekData!["user_training_week_id"].toString()) {
          services.sharedPreferences.setString(
              "weekId", weekData!["user_training_week_id"].toString());
          services.sharedPreferences.setString("days", "0");
        } else {
          days = int.parse(services.sharedPreferences.getString("days") ?? "0");
        }

        // statusRequs = StatusRequest.success;
        statusRequest(StatusRequest.success);
      } else if (res["status"] == "failure") {
        globalSnakbar(title: "wring", body: "error");

        // statusRequs = StatusRequest.failure;
        statusRequest(StatusRequest.failure);
      } else {
        //statusRequs = StatusRequest.failure;
        statusRequest(StatusRequest.failure);
      }
    } else {
      //statusRequs = StatusRequest.offlineFailure;
      statusRequest(StatusRequest.offlineFailure);
    }
    update();
  }

  @override
  String getDayName(int dayNumber) {
    List<String> dayNames = [
      "اليوم الاول",
      "اليوم الثاني",
      "اليوم الثالث",
      "اليوم الرابع",
      "اليوم الخامس",
      "اليوم السادس",
      "اليوم السابع"
    ];
    if (dayNumber < 0 || dayNumber >= dayNames.length) {
      return "اليوم الاول"; // Default value for invalid day numbers
    }
    return dayNames[dayNumber];
  }

  @override
  void gotoTrainingDay(int trainingDayId, int index) {
    Get.toNamed(AppRoute.trainingDayId, arguments: {
      "triningDayId": trainingDayId,
      "lastDay": trainingDayModellList.length - days == 1,
      "canTrain": days == index
    });
  }
}
