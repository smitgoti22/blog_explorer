import 'package:blog_app/controllers/details_controller.dart';
import 'package:blog_app/controllers/home_controller.dart';
import 'package:blog_app/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';

class AllControllers extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DetailsController>(() => DetailsController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<FavouriteController>(() => FavouriteController());
  }
}
