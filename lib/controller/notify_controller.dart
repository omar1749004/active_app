import 'package:active_app/core/class/statuscode.dart';
import 'package:active_app/core/functions/checkinternet.dart';
import 'package:active_app/core/services/services.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController
{
 
  late StatusRequest statusRequs;
  MyServices myServices = Get.find();  
    List data = [];
getData()async
{
  statusRequs = StatusRequest.loading;
  
  if(await checkinternet() )
  {   
    
    //  var res = await NotifyData().getData(
    //   myServices.sharedPreferences.getString("id")!
    //  );
    //  if(res["status"] =="failure")
    //  {
    //    statusRequs =StatusRequst.sucsess;
    //  }else{
    //   print("hello");
    //   statusRequs =StatusRequst.sucsess;
    //   for(int i =0;i< res["data"].length;i++)
    //   {
    //        data.add(res["data"][i]) ;
    //   }
      
    //  }
     
  }
  else {
    statusRequs =StatusRequest.offlineFailure;
  }
  update();
}

@override
  void onInit() {
    getData();//أفعل الميثود
    super.onInit();
  }
}