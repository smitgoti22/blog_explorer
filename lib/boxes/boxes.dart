import 'package:blog_app/models/favourites_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<FavouritesModel> getData() =>
      Hive.box<FavouritesModel>('favouriteBox');
}
