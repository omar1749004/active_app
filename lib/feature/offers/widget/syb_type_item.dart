import 'package:active_app/feature/offers/widget/sub_period_container.dart';
import 'package:flutter/material.dart';
class SubscriptionTypeItme extends StatelessWidget {
  const SubscriptionTypeItme({super.key});
 
  @override
  Widget build(BuildContext context) { 
    return 
    ExpansionPanelList(
          elevation: 2,
          expandedHeaderPadding: EdgeInsets.zero,
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text("كمال اجسام او فيتنس سويدي"),
                );
              },
              body: 
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SubscriptionPeriodContainer(),
                  ),
                  
                 
                ],
              ),
              
              isExpanded: false,
              canTapOnHeader: true,
              backgroundColor: Colors.white,
            ),
            
          ],
          expansionCallback: (panelIndex, isExpanded) {
          },
        );
    
    

  }
}