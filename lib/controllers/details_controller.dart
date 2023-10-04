import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  Map arg = {};
  var title = "";
  var imageUrl = "";
  @override
  void onInit() {
    arg = Get.arguments;
    if (kDebugMode) {
      print(arg);
    }
    title = arg['title'];
    imageUrl = arg['imageUrl'];
    update();
    if (kDebugMode) {
      print(title);
    }
    if (kDebugMode) {
      print(imageUrl);
    }

    super.onInit();
  }
}
