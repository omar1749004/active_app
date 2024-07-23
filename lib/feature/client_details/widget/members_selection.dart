import 'package:flutter/material.dart';
 import 'package:active_app/core/constant/color.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/data/models/trainer_model.dart';
import 'package:active_app/feature/client_details/widget/trainer_item.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:get/get.dart';

class MembersSelections extends StatelessWidget {
  const MembersSelections(
      {super.key,
      required this.members,
      required this.appbarTitle,
      this.onNextPressed, required this.nextText, this.onTap, required this.selectIndex});
  final List<TrainerModel> members;
  final String appbarTitle;
  final String nextText ;
  final void Function()? onNextPressed;
  final void Function(int index,int id)? onTap;
  final int selectIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomForgetPassAppBar(
        text: appbarTitle,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 38,
                  ),
                  GridView.builder(
                      shrinkWrap: true, // مهم
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: members.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              childAspectRatio: 0.63),
                      itemBuilder: (BuildContext context, index) {
                        return CustomTrainerGridView(
                          trainerModel: members[index],
                          onTap: (){
                            onTap!(index,members[index].usersId!,) ;
                          },
                          isTap: selectIndex == index ? true : false ,
                        );
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 155,
                  child: CustomButton(
                    text: nextText,
                    onPressed: selectIndex != -1 ? onNextPressed :null
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorApp.kPrimaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: IconButton(
                      onPressed: () {
                        Get.back() ;
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: ColorApp.white,
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
