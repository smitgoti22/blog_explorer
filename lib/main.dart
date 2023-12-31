import 'package:blog_app/bindings/allControllers.dart';
import 'package:blog_app/const/constants.dart';
import 'package:blog_app/models/favourites_model.dart';
import 'package:blog_app/views/blogs_explorer.dart';
import 'package:blog_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  /// hive database intilize
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  /// register box in hive
  Hive.registerAdapter(FavouritesModelAdapter());
  await Hive.openBox<FavouritesModel>('favouriteBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blog Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(primary: whiteColor),
          appBarTheme: AppBarTheme(
              backgroundColor: blackColor2,
              titleTextStyle: TextStyle(color: whiteColor)),
          scaffoldBackgroundColor: blackColor),
      initialBinding: AllControllers(),
      home: Home(),
    );
  }
}
