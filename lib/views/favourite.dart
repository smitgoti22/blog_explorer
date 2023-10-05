import 'package:blog_app/controllers/favourite_controller.dart';
import 'package:blog_app/models/favourites_model.dart';
import 'package:blog_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../boxes/boxes.dart';
import '../const/constants.dart';
import '../widgets/container.dart';
import 'details.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// for make responsive design
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Favourites",
        ),
        elevation: 0.3,
      ),
      body: SafeArea(
          child: GetBuilder<FavouriteController>(
              init: FavouriteController(),
              builder: (controller) {
                return ValueListenableBuilder(
                    valueListenable: Boxes.getData().listenable(),
                    builder: (context, box, _) {
                      var data = box.values.toList().cast<FavouritesModel>();
                      return ListView.builder(
                        itemCount: data.length,
                        primary: false,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.015,
                            vertical: height * 0.015),
                        reverse: true,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              /// navigate to details screen
                              Get.to(Details(), arguments: {
                                "title": data[index].blogTitle.toString(),
                                "imageUrl": data[index].imageUrl.toString()
                              });
                            },
                            child: AppContainer(
                              margin: EdgeInsets.symmetric(
                                  vertical: height * 0.02,
                                  horizontal: width * 0.02),
                              color: blackColor,
                              borderradious: BorderRadius.circular(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// image
                                  Stack(
                                    children: [
                                      AppContainer(
                                        height: height * 0.25,
                                        width: double.infinity,
                                        color: blackColor,
                                        borderradious:
                                            BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              data[index].imageUrl.toString(),
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                      Positioned(
                                        top: 15,
                                        right: 15,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              blackColor.withOpacity(0.5),
                                          child: Center(
                                              child: IconButton(
                                                  onPressed: () async {
                                                    /// pass data to favourite controller and save data.
                                                    controller.deteleSavedBlog(
                                                        data[index]);
                                                  },
                                                  icon: Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red,
                                                  ))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),

                                  /// Blog title
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Container(
                                        child: Flexible(
                                          child: AppText(
                                            text: "${data[index].blogTitle}",
                                            color: whiteColor,
                                            fontweight: FontWeight.bold,
                                            size: 18,
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    });
              })),
    );
  }
}
