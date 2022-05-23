import 'dart:async';
import 'dart:io' as io;
import 'package:flutter_carousel_sample_app/model/carousel_conatiner_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;
  Future<Database> get database async => _db ??= await initDb();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Carousel(id INTEGER PRIMARY KEY, url TEXT, title TEXT, subTitle TEXT,detailText TEXT, isFavorite INTEGER )");
    // print("Created tables");
  }

  Future _insertAccount(String url, String title, String subTitle,
      String detailText, int isFavorite) async {
    var dbClient = _db;
    if (dbClient != null) {
      var values = <String, dynamic>{
        "url": url,
        "title": title,
        "subTitle": subTitle,
        "detailText": detailText,
        "isFavorite": isFavorite,
      };
      await dbClient.insert("account", values);
    }
  }

  Future<List<CarouselContainerModel>> getCarousel() async {
    var dbClient = _db;
    List<CarouselContainerModel> carousel = List.empty();
    if (dbClient != null) {
      List<Map> list = await dbClient.query("Carousel");

      for (int i = 0; i < list.length; i++) {
        carousel.add(CarouselContainerModel(
            list[i]["id"],
            list[i]["url"],
            list[i]["title"],
            list[i]["subTitle"],
            list[i]["detailText"],
            list[i]["isFavorite"]));
      }
      // print(carousel.length);
    }
    return carousel;
  }
}
