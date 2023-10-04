import 'package:blog_app/controllers/details_controller.dart';
import 'package:blog_app/controllers/home_controller.dart';
import 'package:blog_app/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';

/// colors
var blackColor = Color(0xff1B1B1B);
var blackColor2 = Color(0xff303030);
var tealColor = Color(0xff00ADB5);
var whiteColor = Color(0xffFFFFFFF);
var blueColor = Color(0xff3F51B5);

///Image Paths
var logoImage = "assets/logo.png";

/// api key
var getBlogsKey = "https://intent-kit-16.hasura.app/api/rest/blogs";
var secretHeaderKey = "x-hasura-admin-secret";
var secretHeaderValue =
    "32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6";

/// static content
var blogDescription =
    "In the era of digitalization, managing recurring payments can be a hassle-free process. Subspace helps simplify this process with its recurring payment flow system. The system is designed to allow users to create, manage, and track recurring payments, particularly focusing on rental payments for Grow90 furniture. This post will walk you through the process, step by step.\n\n Initiating a recurring payment with Subspace is quite simple and user-friendly. Let's say you have selected a furniture rental plan on the Grow90 website. The next step is to set up a payment mandate. The user can specify the payment frequency (for example, monthly), the payment amount, the recipient (in this case, Grow90), and the start date for the recurring payment. This mandate creation process ensures that the user has complete control over their payment schedule and amount. \n\n Once the payment mandate is set up, the user will review and confirm the payment details. This step is significant as it allows the user to check all the details before the recurring payment is processed. With Subspace, users have the flexibility and control to authorize or cancel their recurring payments.";

/// controllers
var favouriteController = Get.find<FavouriteController>();
var homeController = Get.find<HomeController>();
var searchController = Get.find<SearchController>();
var detailsController = Get.find<DetailsController>();
