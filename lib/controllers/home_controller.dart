import 'dart:convert';

import 'package:blog_app/const/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/blogModel.dart';

class HomeController extends GetxController {
  List blogsList = [];
  var res;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  onInit() async {
    if (kDebugMode) {
      print(
        "function started",
      );
    }
    await fetchBlogs();

    super.onInit();
  }

  /// fetch blog
  Future<FetchBlogsModel>? fetchBlogs() async {
    /// api calling
    try {
      http.Response response = await http.get(Uri.parse(getBlogsKey), headers: {
        secretHeaderKey: secretHeaderValue,
      });

      var res = jsonDecode(response.body.toString());

      /// if has call sucessfully
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body.toString());
        }
        return FetchBlogsModel.fromJson(res);
      }

      /// request failed
      else {
        if (kDebugMode) {
          print('Request failed with status code: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response data: ${response.body}');
        }
        return FetchBlogsModel.fromJson(res);
      }
    } catch (e) {
      /// error message
      if (kDebugMode) {
        print("Error Message ====>>> $e");
      }
      return FetchBlogsModel.fromJson(res);
    }
  }

  /// open Drawer
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }
}
