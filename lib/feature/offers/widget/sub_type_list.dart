import 'package:active_app/feature/offers/widget/syb_type_item.dart';
import 'package:flutter/widgets.dart';

class SubscriptionTypeList extends StatelessWidget {
  const SubscriptionTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     itemCount: 8,
     shrinkWrap: true, // مهم
        physics:const NeverScrollableScrollPhysics(),
     
     itemBuilder: (context , index){
       return  Padding(
         padding: const EdgeInsets.only(bottom: 18),
         child: SubscriptionTypeItme()
       );
     }
      );
  }
}

