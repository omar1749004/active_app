import 'package:active_app/feature/training/widget/day_record.dart';
import 'package:flutter/material.dart';

class RecordSection extends StatelessWidget {
  const RecordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
                padding:const EdgeInsets.all(20),
                children: [
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: CustomHomeTitle(text: "chest fly (Dumbbell)")),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index){
                    return  Column(
                      children: [
                        DayRecord(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Divider( 
                                        height: 1,
                                        
                                        color: Colors.grey,
                                      ),
                      ),
                      ],
                    ) ;
                  })
                 
                ],
              );
  }
}