import 'dart:io';

import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class NutritionData {
  NutritionData();
  view(Map data) async {
    var res = await Api().post(uri: linkNutritionView, body: data);
    return res;
  }

 add(Map data, File file)async{
    var res =await Api().postFile(uri: linkNutritionAdd, body: data,file: file
    );
    return res;
  }

  delete(Map data) async {
    var res = await Api().post(uri: linkNutritionDelete, body: data);
    return res;
  }
}

// {
//       'nutrition_id': nutritionId,
//       'nutrition_userId': nutritionUserId,
//       'nutrition_desc': nutritionDesc,
//       'nutrition_image': nutritionImage,
//       'nutrition_calory': nutritionCalory,
//       'nutrition_created_at': nutritionCreatedAt,
//     };