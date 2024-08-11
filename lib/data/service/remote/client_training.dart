import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class ClientTrainingData {
  ClientTrainingData();
    cliantView(Map data)async{
    var res =await Api().post(uri: linkClientView, body: data);
    return res;
  }
     weekCliantView(Map data)async{
    var res =await Api().post(uri: linkWeekClientView, body: data);
    return res;
  }

     captinView(Map data)async{
    var res =await Api().post(uri: linkClientCaptinView, body: data);
    return res;
  }

   add(Map data)async{
    var res =await Api().post(uri: linkClientTriningAdd, body: data,
    );
    return res;
  }
   edit(Map data )async{
     var res =await Api().post(uri: linkClientTriningEdit, body: data);
    return res;
    
  }
  //  delete(Map data)async{
  //   var res =await Api().post(uri: linkBracnhDelete, body: data);
  //   return res;
  // }
  
}

// {
//       'usersid': branchId,
//       'captainid': branchNameAr,
//       'trainingid': branchNameEn,
//       'traingset': branchOpenDayAr,
//       'time': branchOpenDayEn,
//     };