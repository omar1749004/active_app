import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class VerfyCodeData
{

  postData({
  required String email ,
  required String verfycode
 })async{
    var res =await Api().post(uri: linkVerfycode, body: {
      "email": email ,
      "verfycode": verfycode,
      
    });
    return res;
  }
  resendData({required String email })async
  {
     await Api().post(uri: linkResend, body: {
      "email": email ,});
    
  }
}