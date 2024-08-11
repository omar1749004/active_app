import 'package:active_app/controller/offres_controller.dart';
import 'package:active_app/feature/offers/widget/sub_period_container.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SubscriptionTypeList extends GetView<OffresControlllerImp> {
  const SubscriptionTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     itemCount: controller.subModelList.length,
     shrinkWrap: true, // مهم
        physics:const NeverScrollableScrollPhysics(),
     
     itemBuilder: (context , index){
       return  Padding(
         padding: const EdgeInsets.only(bottom: 18),
         child: SubscriptionPeriodContainer(
            subModel: controller.subModelList[index],
            isTap: controller.subindex == index ? true : false,
            (){
              controller.selectSub(index) ;
            }
         ),

     //    child: SubscriptionTypeItme()
       );
     }
      );
  }
}

