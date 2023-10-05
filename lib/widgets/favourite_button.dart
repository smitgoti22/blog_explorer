import 'package:blog_app/controllers/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/constants.dart';

class FavouriteButto extends GetView<FavouriteController> {
  final String id;
  final String blogTitle;
  final String imageurl;

  FavouriteButto(
      {Key? key,
      required this.id,
      required String this.blogTitle,
      required String this.imageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        /// pass data to favourite controller and save data.
        await favouriteController.FaouritesBlogs(
            id: this.id, imageUrl: this.imageurl, title: this.blogTitle);
        favouriteController.update();

        print("value is ===>> " + favouriteController.isFavourite.toString());
      },
      child: CircleAvatar(
        backgroundColor: blackColor.withOpacity(0.5),
        child: Center(
            child: IconButton(
                onPressed: () async {},
                icon: favouriteController.isFavourite == true
                    ? Icon(
                        Icons.favorite,
                        color: tealColor,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: tealColor,
                      ))),
      ),
    );
  }
}
