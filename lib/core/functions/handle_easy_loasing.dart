import 'package:active_app/core/class/statuscode.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void statusRequest(StatusRequest status) {
  switch (status) {
    case StatusRequest.loading:
      EasyLoading.show();
      break;
    case StatusRequest.success:
    case StatusRequest.failure:
    case StatusRequest.serverFailure:
    case StatusRequest.offlineFailure:
      EasyLoading.dismiss();
      break;
    default:
      EasyLoading.dismiss();
      break;
  }
}