import 'package:blog_app/controllers/home_controller.dart';
import 'package:blog_app/controllers/search_controller.dart';
import 'package:blog_app/views/search_page.dart';
import 'package:blog_app/widgets/add_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/constants.dart';
import '../models/blogModel.dart';
import '../widgets/container.dart';
import '../widgets/text.dart';
import 'details.dart';

class BlogsExplorer extends StatelessWidget {
  const BlogsExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    /// for make responsive design
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: AppText(
                text: "Blogs and Articles",
                size: 18,
                fontweight: FontWeight.bold,
              ),
              actions: [
                /// favourite button
                CircleAvatar(
                  backgroundColor: blueColor,
                  child: Center(
                      child: IconButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SearchPage())),
                          icon: Icon(
                            Icons.search,
                            color: whiteColor,
                          ))),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
              ],
              automaticallyImplyLeading: true,
              elevation: 2,
              shadowColor: Colors.black,
            ),
            body: FutureBuilder(
              future: Get.find<HomeController>().fetchBlogs(),
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
                              vertical: height * 0.01,
                              horizontal: width * 0.02),
                          color: blackColor2,
                          borderradious: BorderRadius.circular(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// image
                              Stack(
                                children: [
                                  AppContainer(
                                    height: height * 0.25,
                                    width: double.infinity,
                                    borderradious: BorderRadius.vertical(
                                        top: Radius.circular(6)),
                                    color: blackColor,
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
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: tealColor,
                                              ))),
                                    ),
                                  ),
                                ],
                              ),
                              addVerticalSpace(height * 0.01),

                              /// Blog title
                              Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                  Flexible(
                                    child: AppContainer(
                                      padding: EdgeInsets.only(right: 5),
                                      child: AppText(
                                        text: "${data.title}",
                                        color: whiteColor,
                                        fontweight: FontWeight.bold,
                                        size: 19,
                                        // maxlines: 1,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              addVerticalSpace(height * 0.02)
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
        });
  }
}
