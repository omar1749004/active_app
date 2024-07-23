import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class ResetPasswordData
{
  
  postData({
   required String password ,
   required String email ,
 })async{
    var res =await Api().post(uri: linkResetePass, body: {
      "password": password ,
      "email": email ,
      
    });
    return res;
  }
}