import 'dart:io';

import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class BranchData {
  BranchData();

    view()async{
    var res =await Api().post(uri: linkBracnhView, body: {});
    return res;
  }

   add(Map data, File file)async{
    var res =await Api().postFile(uri: linkBracnhAdd, body: data,file: file
    );
    return res;
  }
   edit(Map data )async{
     var res =await Api().post(uri: linkBracnhEdit, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkBracnhDelete, body: data);
    return res;
  }
  
}


// {
//       'branch_id': branchId,
//       'branch_name_ar': branchNameAr,
//       'branch_name_en': branchNameEn,
//       'branch_open_day_ar': branchOpenDayAr,
//       'branch_open_day_en': branchOpenDayEn,
//       'branch_open_time': branchOpenTime,
//       'branch_details_ar': branchDetailsAr,
//       'branch_details_en': branchDetailsEn,
//     };