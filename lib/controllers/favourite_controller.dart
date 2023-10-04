import 'package:blog_app/models/favourites_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../boxes/boxes.dart';

class FavouriteController extends GetxController {
  var isFavourite = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  FaouritesBlogs({
    required String id,
    required String title,
    required String imageUrl,
  }) async {
    isFavourite = !isFavourite;
    await saveBlog(id: id, title: title, imageUrl: imageUrl);
    update();
  }

  Future<void> saveBlog({
    required String id,
    required String title,
    required String imageUrl,
  }) async {
    // print('income =========>>>>  ${income}');
    final data =
        FavouritesModel(blogId: id, blogTitle: title, imageUrl: imageUrl);
    final box = Boxes.getData();
    await box.add(data);
    await data.save();

    print(' Data =========>>>> ${box}');
  }
}
