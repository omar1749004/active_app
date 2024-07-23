import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class ClientCaptinData {
  ClientCaptinData();
    getCaptins(Map data)async{
    var res =await Api().post(uri: linkGetCaptins, body: data);
    return res;
  }
    
   getClients(Map data)async{
    var res =await Api().post(uri: linkGetCaptins, body: data);
    return res;
  }
}