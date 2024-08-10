import 'dart:io';

import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class ProfileData{
    
    editImage(Map data, File file) async {
    var res = await Api().postFile(uri: linkeditImage, body: data , file: file);
    return res;
  }
}