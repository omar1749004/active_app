import 'package:active_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish =ThemeData(
         primarySwatch:  Colors.deepPurple,
         appBarTheme:const  AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorApp.kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26)
         ) ,
         floatingActionButtonTheme: FloatingActionButtonThemeData(
          
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          
          backgroundColor: ColorApp.kPrimaryColor),
         fontFamily: "Pacifico-Regular",
         
      );
ThemeData themeArabic =ThemeData(
       scaffoldBackgroundColor: ColorApp.white,
         primarySwatch:  Colors.deepPurple,
         appBarTheme: const  AppBarTheme(backgroundColor: ColorApp.kPrimaryColor),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: ColorApp.kPrimaryColor),

        //  fontFamily: "Cairo-Medium"
        fontFamily: 'Cairo'
        
      );