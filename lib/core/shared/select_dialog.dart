  import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>selectDialog(void Function(String?)? onChanged ,
String  currentLanguage,
List<String> selectList){
   Get.defaultDialog(
    title :'Select Subscription',
    titlePadding: const EdgeInsets.only(top: 16),
    content: Column(
            mainAxisSize: MainAxisSize.min,
            children: selectList.map((String value) {
              return RadioListTile<String>(
                fillColor: MaterialStateProperty.all<Color>(ColorApp.kPrimaryColor),
                title: Text(value),
                value: value,
                groupValue: currentLanguage,
                onChanged: onChanged
              );
            }).toList(),
          ),
   
  );
   return Future.value(true);
}