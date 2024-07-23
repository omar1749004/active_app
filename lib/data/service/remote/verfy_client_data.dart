import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class VerfyClient{

  VerfyClient() ;

  
  verfyCode(Map data) async {
    var res = await Api().post(uri: linkVerfyBarcode, body: data);
    return res;
  }

  accountRalated(Map data) async {
    var res = await Api().post(
      uri: linkAccountRalated,
      body: data,
    );
    return res;
  }
  
   saveImage(String imageName)async{
     var file = await Api().downloadAndSaveImage(linkImageUpload, imageName);
    return file;
  }

   Future<bool> foundImage(String imageName)async{
     bool isFound = await Api().findeImage(imageName);
    return isFound;
  }
  
}