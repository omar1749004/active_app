import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class SignupData 
{

  postData(Map data)async{
    var res =await Api().post(uri: linkSignup, body: data);
    return res;
  }
}