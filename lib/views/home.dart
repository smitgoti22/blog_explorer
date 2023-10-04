import 'package:blog_app/const/constants.dart';
import 'package:blog_app/controllers/favourite_controller.dart';
import 'package:blog_app/controllers/home_controller.dart';
import 'package:blog_app/models/blogModel.dart';
import 'package:blog_app/views/blogs_explorer.dart';
import 'package:blog_app/views/details.dart';
import 'package:blog_app/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    /// for make responsive design
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          /// appbar
          appBar: AppBar(
            title: SizedBox(
                height: height * 0.04,
                child: Image(image: AssetImage(logoImage))),
            elevation: 2,
            shadowColor: Colors.black,
            actions: [
              /// menu button
              CircleAvatar(
                backgroundColor: whiteColor,
                child: Center(
                    child: IconButton(
                        onPressed: () {
                          homeController.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: blackColor,
                        ))),
              ),
              SizedBox(
                width: width * 0.05,
              )
            ],
            automaticallyImplyLeading: false,
          ),

          drawer: Drawer(
            backgroundColor: blackColor2,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),

                /// logo image
                SizedBox(
                    height: height * 0.04,
                    child: Image(image: AssetImage(logoImage))),

                SizedBox(
                  height: height * 0.05,
                ),

                Divider(
                  color: whiteColor.withOpacity(0.5),
                ),

                /// Blogs Explore
                ListTile(
                  onTap: () {
                    /// navigate to blog explorer screen
                    homeController.scaffoldKey.currentState!.closeDrawer();
                    Get.to(BlogsExplorer());
                  },
                  leading: Icon(
                    Icons.explore,
                    color: whiteColor,
                  ),
                  minLeadingWidth: 0,
                  title: AppText(
                    text: "Blogs Explore",
                    color: whiteColor,
                    size: 16,
                    fontweight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: whiteColor.withOpacity(0.5),
                ),

                /// favourites
                ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: whiteColor,
                  ),
                  minLeadingWidth: 0,
                  title: AppText(
                    text: "Faourites",
                    color: whiteColor,
                    size: 16,
                    fontweight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: whiteColor.withOpacity(0.5),
                ),
              ],
            ),
          ),

          key: homeController.scaffoldKey,
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: blueColor,
              child: Icon(
                Icons.chat_bubble_rounded,
                color: whiteColor,
              )),
          body: FutureBuilder(
            future: controller.fetchBlogs(),
            builder: (context, AsyncSnapshot<FetchBlogsModel> snapshot) {
              if (snapshot.hasData) {
                /// Blogs List
                return ListView.builder(
                  // itemCount: snapshot.data!.blogs!.length,
                  itemCount: 25,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.blogs![index];

                    return GestureDetector(
                      onTap: () {
                        /// navigate to details screen
                        Get.to(Details(), arguments: {
                          "title": data.title.toString(),
                          "imageUrl": data.imageUrl.toString()
                        });
                      },
                      child: AppContainer(
                        margin: EdgeInsets.symmetric(
                            vertical: height * 0.02, horizontal: width * 0.02),
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
                                  borderradious: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        data.imageUrl.toString(),
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
                                            onPressed: () {
                                              favouriteController
                                                  .FaouritesBlogs();
                                              controller.update();
                                              print("value is ===>> " +
                                                  favouriteController
                                                      .isFavourite
                                                      .toString());
                                            },
                                            icon: favouriteController
                                                        .isFavourite ==
                                                    true
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: tealColor,
                                                  )
                                                : Icon(
                                                    Icons.favorite_border,
                                                    color: tealColor,
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
                                      text: "${data.title}",
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
              } else {
                /// show loader while loading data
                return Center(
                  child: CircularProgressIndicator(color: tealColor),
                );
              }
            },
          ),
        );
      },
    );
  }
}
