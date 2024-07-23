import 'dart:math';

import 'package:active_app/core/class/statuscode.dart';
import 'package:flutter/material.dart';

import '../constant/image_asset.dart';

class HandlingDataView extends StatelessWidget {

  const HandlingDataView({super.key, required this.statusRequs, required this.widget});
 final StatusRequest statusRequs;
 final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequs ==StatusRequest.loading? 
          Column(children:[
            SizedBox(height: 120,),
            //  LottieBuilder.asset(ImageAsset.loading, )
             ])
        :
        statusRequs ==StatusRequest.offlineFailure? 
         Center(
          // child:
          // LottieBuilder.asset(ImageAsset.offline, repeat: false)
          )
         :
         statusRequs ==StatusRequest.failure? 
         Center(
          // child: LottieBuilder.asset(ImageAsset.nodata , repeat: false,),
          )
         :widget;
  }
}
class HandlingDataReques extends StatelessWidget {

  const HandlingDataReques({super.key, required this.statusRequs, required this.widget});
 final StatusRequest statusRequs;
 final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequs ==StatusRequest.loading? 
         Center(
            child: Container(),
          // child: LottieBuilder.asset(ImageAsset.loading, repeat: false),
          )
        :
        statusRequs ==StatusRequest.offlineFailure?//  edit 
         Center(
          // child: LottieBuilder.asset(ImageAsset.offline, repeat: false),
          )
         :widget;
  }
}