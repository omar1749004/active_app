import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class HomeData{
 HomeData();

   view(Map data)async{
    var res =await Api().post(uri: linkHomePage, body: data);
    return res;
  }
   
}