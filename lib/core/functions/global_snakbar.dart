import 'package:get/get.dart';

Future<bool> globalSnakbar({required String title, required String body}) {
  Get.snackbar(title, body);
  return Future.value(true);
}
