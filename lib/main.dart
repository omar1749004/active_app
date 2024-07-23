import 'package:active_app/core/localization/change_lacal.dart';
import 'package:active_app/core/localization/translition.dart';
import 'package:active_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:active_app/routs.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await intialService();
  configEasyLoading() ;
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  LocalController controller=  Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      getPages: routs,
      title: 'Flutter Demo',
      theme: controller.apptheme,
      builder: EasyLoading.init(),
    );
  }
}

void configEasyLoading() {
  EasyLoading.instance
    //..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 65.0
    ..radius = 10.0
    //..progressColor = Colors.yellow
    ..backgroundColor = Colors.transparent// Use transparent background or a lighter color
    ..indicatorColor = Colors.white // Color of the small circle
    ..textColor = Colors.white // Text color (if applicable)
    ..maskColor = Colors.black.withOpacity(0.4)
    ..boxShadow = <BoxShadow>[]  // to remove ..backgroundColor
    ..maskType =EasyLoadingMaskType.custom
    ..userInteractions = false
    ..dismissOnTap = false;
}




// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// String prettyPrint(Map json) {
//   JsonEncoder encoder = const JsonEncoder.withIndent('  ');
//   String pretty = encoder.convert(json);
//   return pretty;
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Map<String, dynamic>? _userData;
//   AccessToken? _accessToken;
//   bool _checking = true;

//   @override
//   void initState() {
//     super.initState();
//     _checkIfIsLogged();
//   }

//   Future<void> _checkIfIsLogged() async {
//     final accessToken = await FacebookAuth.instance.accessToken;
//     setState(() {
//       _checking = false;
//     });
//     if (accessToken != null) {
//       print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
//       // now you can call to  FacebookAuth.instance.getUserData();
//       final userData = await FacebookAuth.instance.getUserData();
//       // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//       _accessToken = accessToken;
//       setState(() {
//         _userData = userData;
//       });
//     }
//   }

//   void _printCredentials() {
//     print(
//       prettyPrint(_accessToken!.toJson()),
//     );
//   }

//   Future<void> _login() async {
//     final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile

//     // loginBehavior is only supported for Android devices, for ios it will be ignored
//     // final result = await FacebookAuth.instance.login(
//     //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
//     //   loginBehavior: LoginBehavior
//     //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
//     // );

//     if (result.status == LoginStatus.success) {
//       _accessToken = result.accessToken;
//       _printCredentials();
//       // get the user data
//       // by default we get the userId, email,name and picture
//       final userData = await FacebookAuth.instance.getUserData();
//       // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//       _userData = userData;
//     } else {
//       print(result.status);
//       print(result.message);
//     }

//     setState(() {
//       _checking = false;
//     });
//   }


//   Future<void> _logOut() async {
//     await FacebookAuth.instance.logOut();
//     _accessToken = null;
//     _userData = null;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Facebook Auth Example'),
//         ),
//         body: _checking
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         _userData != null ? prettyPrint(_userData!) : "NO LOGGED",
//                       ),
//                       const SizedBox(height: 20),
//                       _accessToken != null
//                           ? Text(
//                               prettyPrint(_accessToken!.toJson()),
//                             )
//                           : Container(),
//                       const SizedBox(height: 20),
//                       CupertinoButton(
//                         color: Colors.blue,
//                         child: Text(
//                           _userData != null ? "LOGOUT" : "LOGIN",
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         onPressed: _userData != null ? _logOut : _login,
//                       ),
//                       const SizedBox(height: 50),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }