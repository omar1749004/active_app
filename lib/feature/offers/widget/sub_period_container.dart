import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class SubscriptionPeriodContainer extends StatelessWidget {
  const SubscriptionPeriodContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                      onTap: (){},
                      child: Container(
                                padding: const EdgeInsets.only(right: 14,left: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: ColorApp.gray2)
                                ),
                                 child:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "6 شهور",
                               // style: Styles.style20B,
                              ),
                            ),
                             Text(
                            '350',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              
                            ),),
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                  shape: const CircleBorder(),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: ColorApp.kPrimaryColor,
                                  value: true,
                                  onChanged: (val) {}),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}