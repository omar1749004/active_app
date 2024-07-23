import 'package:active_app/core/constant/image_asset.dart';
import 'package:active_app/core/constant/styles.dart';
import 'package:active_app/core/shared/custom_button.dart';
import 'package:active_app/feature/home/widget/custom_home_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodIngredients extends StatelessWidget {
  const FoodIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), // Adjust the radius as needed
            bottomRight: Radius.circular(20), // Adjust the radius as needed
          ),
        ),
        centerTitle: true,
        title: Text("المكونات",style: Styles.style20.copyWith(color: Colors.white),),
        iconTheme:const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView(
              children: [
             const   SizedBox(height: 24,),
                CustomHomeTitle(text: "وجبه الافطار"),
             const   SizedBox(height: 24,),
                Center(
                  child: Image.asset(ImageAsset.food, 
                  height: 300,
                                 width: 300,
                                 fit: BoxFit.fill,
                  ),
                ),
               const SizedBox(height: 24,),
                CustomHomeTitle(text: "المكونات"),
             const   SizedBox(height: 16,),
                Text("تالالاب ستق سلاققسلاراق سرلاسق بقسا رسق لسقت لسقا للاسلاق لسقل لاسقتال سقل سقتل سقتل سقال سقهعالبسقلسعقلابسعاقلالبعسق سقعابلاسقا لسقعال سقلال لاسق لاسق للاسق لسقال سقا لسق لهسق رلاس سعلا غقابقس لعقس لتسقى لسعقل سقى للااسقلسق لسلاق لاسقلا لاسق لسق ل",
                style: Styles.style16G2W7.copyWith(height: 2),
                ),
                //  Text("تالالاب ستق سلاققسلاراق سرلاسق بقسا رسق لسقت لسقا للاسلاق لسقل لاسقتال سقل سقتل سقتل سقال سقهعالبسقلسعقلابسعاقلالبعسق سقعابلاسقا لسقعال سقلال لاسق لاسق للاسق لسقال سقا لسق لهسق رلاس سعلا غقابقس لعقس لتسقى لسعقل سقى للااسقلسق لسلاق لاسقلا لاسق لسق ل",
                // style: Styles.style16G2W7.copyWith(height: 2),
                // ),
                //  Text("تالالاب ستق سلاققسلاراق سرلاسق بقسا رسق لسقت لسقا للاسلاق لسقل لاسقتال سقل سقتل سقتل سقال سقهعالبسقلسعقلابسعاقلالبعسق سقعابلاسقا لسقعال سقلال لاسق لاسق للاسق لسقال سقا لسق لهسق رلاس سعلا غقابقس لعقس لتسقى لسعقل سقى للااسقلسق لسلاق لاسقلا لاسق لسق ل",
                // style: Styles.style16G2W7.copyWith(height: 2),
                // ),
                SizedBox(height: 100,)
              ],
              
            ),
            
            Positioned(
              bottom:32,
          left: 16,
          right: 16,
              child: CustomButton(text: "أكملت الوجبة",onPressed: (){},),),
          ],
         
        ),
      ),
    );
  }
}