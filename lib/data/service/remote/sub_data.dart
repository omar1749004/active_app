import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';


class SubData {
  SubData();
    view()async{
    var res =await Api().post(uri: linkSubView, body: {});
    return res;
  }

   
  
}
