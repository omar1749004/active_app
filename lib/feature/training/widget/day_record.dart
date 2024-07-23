import 'package:active_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class DayRecord extends StatelessWidget {
  const DayRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2024-05-20' ,style: Styles.style20B,),
                          Text("1 RM",style: Styles.style20B,)
                        ],
                        
                      ),
                    const  SizedBox(height: 10,),
                     ...List.generate(
        3,
        (index) => Column(
          children: [
            Row(children: [
                          Text("${index+1}", style: Styles.style18G2,),
                          Spacer(),
                          Text("60kg * 12",style: Styles.style18G2,),
                          Spacer(flex: 5,),
                          Text("86", style: Styles.style18G2,),
                        ],),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
                    ],
                  );
  }
}