import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  var isFavourite = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  FaouritesBlogs() {
    isFavourite = !isFavourite;
    update();
  }
}
