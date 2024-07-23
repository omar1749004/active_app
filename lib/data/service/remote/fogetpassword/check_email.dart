import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class CheckEmailData
{

  postData({
  required String email ,
 })async{
    var res =await Api().post(uri: linkCheckEmail, body: {
      "email": email ,
      
    });
    return res;
  }
}