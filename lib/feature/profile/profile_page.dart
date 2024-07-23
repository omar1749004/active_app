import 'package:active_app/controller/profile_controller.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:active_app/feature/profile/widget/custom_image_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return Scaffold(
     appBar:  const CustomForgetPassAppBar(
        text: "معلومات عنك",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
        GetBuilder<ProfileControllerImp>(builder:(controller) => 
         ListView(
          children: [
          const  SizedBox(height: 24,),
            Center(
              child: CustomImageProfile()
              
            ),
            const  SizedBox(height: 24,),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text(controller.name),
            ),
          const  Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Birth Date'),
              subtitle: Text(controller.brithday),
            ),
            const  Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text(controller.emil),
            ),
           const Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text(controller.language),
              trailing: Icon(Icons.chevron_right),
              onTap:(){
              //   selectDialog((value){
              //  // Get.back();
              // },"English",['English', 'Arabic'] ) ;
              
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.subscriptions),
              title: Text('Current Subscription'),
              subtitle: Text("Iron"),
              trailing: Icon(Icons.chevron_right),
             onTap:(){
              
              // selectDialog((value){
              //   Get.back();
              // },_language,['English', 'Arabic'] ) ;
              
              },
            ),
          ],
        ),
      ),
    ),
    );
  }

}