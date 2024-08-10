import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

String _basicAuth =
    'Basic ' + base64Encode(utf8.encode('omar_mohsen:omarMohsen194004#'));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {"Authorization": "Bearer $token"},
      );
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there id problem with status code${response.statusCode}");
    }
  }

  Future<dynamic> post({
    required String uri,
    required Map body,
    String? token,
    //Map<String,String> headers = const {}  ,
  }) async {
    // Map<String, String> headers = {};

    if (token != null) {
      myheaders.addAll(
        {"Authorization": "Bearer $token"},
      );
    }

    try {
      http.Response response = await http.post(Uri.parse(uri),
          body: body, headers: myheaders); //myheaders

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map data = jsonDecode(response.body);

        return data;
      } else {
        throw Exception(
            "there id problem with status code${response.statusCode} with body${jsonDecode(response.body)}");
      }
    } catch (e) {
      print("$e");
    }
  }

  Future<dynamic> postJsonType({
    required String uri,
    required body,
    String? token,
    Map<String, String> headers = const {},
  }) async {
    //Map<String, String> headers = {};

    if (token != null) {
      headers.addAll(
        {"Authorization": "Bearer $token"},
      );
    }

    try {
      http.Response response = await http.post(Uri.parse(uri),
          body: jsonEncode(body), headers: headers); //myheaders

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map data = jsonDecode(response.body);

        return data;
      } else {
        throw Exception(
            "there id problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postFile(
      {required String uri, required Map body, required File file}) async {
    var request = http.MultipartRequest("POST", Uri.parse(uri));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartfile = http.MultipartFile("files", stream, length,
        filename: basename(file.path));
    request.headers.addAll(myheaders);
    request.files.add(multipartfile);
    body.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there id problem with status code${response.statusCode}");
    }
  }

  Future<dynamic> put(
      {required String uri,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
    }
    http.Response response =
        await http.put(Uri.parse(uri), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there id problem with status code${response.statusCode} with body${jsonDecode(response.body)}");
    }
  }

  Future<File?> downloadAndSaveImage(String url, String fileName) async {
    try {
      final response = await http.get(Uri.parse("$url/$fileName"));
      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';

        final file = File(filePath);
        await file.writeAsBytes(bytes);
        print('Image saved to $filePath');
        return file;
      }
    } catch (e) {
      print('Failed to download image: $e');
    }
    return null;
  }
  
  Future<bool> deleteImage(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/$fileName";

      final file = File(filePath);

      if (await file.exists()) {
        await file.delete();
        return true ;
      } else {
        return false ;
      }
    } catch (e) {
      print('Failed to delete image: $e');
      return false ;
    }
  }
    Future<bool> findeImage(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return true ;
      } else {
        return false ;
      }
    } catch (e) {
      return false ;
    }
  }

  Future<File?> getImage(String fileName) async {
     try {
       final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
     if (await file.exists()) {
        return file ;
      } else {
        return null ;
      }
    } catch (e) {
      print('Failed to download image: $e');
    }
    return null;
  }
}
//http: ^0.13.4