
import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class LoginData
{

  postData({required String email ,
  required String password ,
  })async{
    var res =await Api().post(uri: linkLogin, body: {
      "email": email ,
      "password": password,
    });
    return res;
  }
}