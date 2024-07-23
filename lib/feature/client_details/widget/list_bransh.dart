import 'package:active_app/controller/branch_selection_controller.dart';
import 'package:active_app/feature/client_details/widget/bransh_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemHome extends GetView<BranshSelectionControllerImp> {
  const ListItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     itemCount: controller.barnchmodelList.length,
     shrinkWrap: true, // مهم
        physics:const NeverScrollableScrollPhysics(),
     
      itemExtent: 150,
     itemBuilder: (context , index){
       return  Padding(
         padding: const EdgeInsets.only(bottom: 18),
         child: 
          BranshItem(branshModel: controller.barnchmodelList[index],
         image: controller.imageMap[controller.barnchmodelList[index].branchId]?.first,
         isTap: controller.branchIndex == index? true :false,
         onTap: (){
            controller.selectBransh(controller.barnchmodelList[index], index) ;
         },
         ),
       );
     }
      );
  }
}