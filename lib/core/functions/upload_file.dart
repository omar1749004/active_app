import 'dart:io';
import 'package:active_app/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  //مش بتحدد انواع
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery({isSvg = false}) async {
  //من الاستوديو
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, //من اختياري
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : [
              "jpg",
              "png",
              "gif",
              "PNG",
              "jpeg",
            ]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

 showBottonSheetGet(imageUploadCameraParameter,fileUploadGalleryParameter) {
  
  Get.bottomSheet(
    Directionality(textDirection: TextDirection.rtl, child: 
         Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: IconButton(
                  
                  onPressed: ()  {
                   imageUploadCameraParameter() ;
                    Get.back();
                  },
                  icon:const Icon(Icons.camera ,color: ColorApp.kPrimaryColor,)
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: IconButton(
                  onPressed: ()  {
                    fileUploadGalleryParameter();
                    Get.back();
                  },
                  icon:const Icon(Icons.image ,color: ColorApp.kPrimaryColor,)
                ),
              ),
            ],
          ),
        ),
      ));
      
}


