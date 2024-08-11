import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/functions/global_snakbar.dart';
import 'package:active_app/data/models/sub_model.dart';
import 'package:active_app/data/service/remote/sub_data.dart';
import 'package:get/get.dart';

abstract class OffresControlller extends GetxController{
  void view();
  String getmonth(int numberOfSession);
  void selectSub(int index) ;
  void gotoPaymentMethod();
  void setEndDate(DateTime startDate) ;
}
class OffresControlllerImp extends OffresControlller {

  StatusRequest statusRequs = StatusRequest.none;
  List<SubModel> subModelList = [];
   int subindex = -1 ; 
   SubModel ? subModel  ;
  DateTime  ?start = DateTime.now();
  DateTime ?end = DateTime.now();

  @override
  void onInit() {
    view();
    super.onInit();
  }
  
    @override
  void view() async {
    // statusRequest(StatusRequest.loading);
    statusRequs = StatusRequest.loading;
    update();
    if (await checkinternet()) {
      var res = await SubData().view();
      if (res["status"] == "success") {
        List data = res["data"];
        subModelList.addAll(data.map((e) => SubModel.fromJson(e)));
        statusRequs = StatusRequest.success;
        // statusRequest(StatusRequest.success);
      } else if (res["status"] == "failure") {
        globalSnakbar(title: "wring", body: "error");
       
        statusRequs = StatusRequest.failure;
        //statusRequest(StatusRequest.failure);
      } else {
        statusRequs = StatusRequest.failure;
        //statusRequest(StatusRequest.failure);
      }
    } else {
      statusRequs = StatusRequest.offlineFailure;
      //statusRequest(StatusRequest.offlineFailure);
    }
    update();
  }
  
  @override
  String getmonth(int numberOfSession) {
    if(numberOfSession <= 30){
      return "1 شهر" ;
    }else{
    double months =  numberOfSession / 30 ;
    return "$months شهور" ;
    }
   
  }

  @override
  void selectSub(int index) {
    subindex = index ;
    subModel = subModelList[index] ;
    setEndDate(start!);
    update();
  }
  
  @override
  void gotoPaymentMethod() {
    Get.toNamed(AppRoute.paymentPageId, arguments: {
      "subModel" : subModel  ,
      "start" : start.toString().substring(0,11) ,
      "end" : end.toString().substring(0,11) ,
    });
  }
   
@override
  void setEndDate(DateTime startDate) {
    if(subModel != null)
    {
     end = startDate.add(Duration(days: subModel!.subscriptionsDay));
    update();
    }
   
  }


  

}