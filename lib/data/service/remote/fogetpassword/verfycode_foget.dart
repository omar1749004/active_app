
import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class VerfyCodeForgetData
{

  postData({
  required String email ,
  required String verfycode
 })async{
    var res =await Api().post(uri: linkFVryfycode, body: {
      "email": email ,
      "verfycode": verfycode,
      
    });
    return res;
  }
}