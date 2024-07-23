import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class SocialLoginData 
{

  socialLogIn(Map data)async{
    var res =await Api().post(uri: linkSocialMedia, body: data);
    return res;
  }
}