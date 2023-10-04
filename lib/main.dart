import 'package:blog_app/bindings/allControllers.dart';
import 'package:blog_app/const/constants.dart';
import 'package:blog_app/views/blogs_explorer.dart';
import 'package:blog_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
