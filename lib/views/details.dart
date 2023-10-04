import 'package:blog_app/const/constants.dart';
import 'package:blog_app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/details_controller.dart';
import '../widgets/container.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Details",
          size: 18,
          fontweight: FontWeight.bold,
        ),
        actions: [
          /// favourite button
          CircleAvatar(
            backgroundColor: blackColor.withOpacity(0.5),
            child: Center(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: tealColor,
                    ))),
          ),
          SizedBox(
            width: width * 0.05,
          ),
        ],
        elevation: 2,
        shadowColor: Colors.black,
      ),
      body: GetBuilder<DetailsController>(
          init: DetailsController(),
          builder: (controller) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    AppText(
                      text: controller.title,
                      size: 20,
                      color: whiteColor,
                      fontweight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    AppContainer(
                      height: height * 0.25,
                      width: double.infinity,
                      color: blackColor,
                      borderradious: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(controller.imageUrl),
                          fit: BoxFit.fill),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "by rober johnson | 8 min",
                          size: 12,
                          color: whiteColor,
                        ),
                        AppText(
                          text: "29, november 2022",
                          size: 12,
                          color: whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    AppText(
                      text: blogDescription,
                      size: 15,
                      color: whiteColor,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
