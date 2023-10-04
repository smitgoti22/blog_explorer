import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

part 'favourites_model.g.dart';

@HiveType(typeId: 0)
class FavouritesModel extends HiveObject {
  @HiveField(0)
  String blogId;

  @HiveField(1)
  String blogTitle;

  @HiveField(2)
  String imageUrl;

  FavouritesModel({
    required this.blogId,
    required this.blogTitle,
    required this.imageUrl,
  });
}
