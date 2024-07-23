import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class AddMalesController extends GetxController{

}

class AddMalesControllerImp extends AddMalesController{
  final formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> meals = [];
}