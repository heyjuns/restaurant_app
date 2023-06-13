import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../modules/restaurants/domain/entities/restaurant_summary_entity.dart';

class DatabaseHelper {
  static const String dbName = 'restaurant_db.db';
  static const String favoriteTable = 'favorite_restaurants';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  late Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $favoriteTable(
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating REAL
          )
          ''',
        );
      },
    );
  }

  Future<void> insertFavoriteRestaurant(
      RestaurantSummaryEntity restaurant) async {
    final db = await database;
    await db.insert(
      favoriteTable,
      restaurant.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('add ${restaurant.id} to db');
  }

  Future<void> deleteFavoriteRestaurant(String restaurantId) async {
    final db = await database;
    await db.delete(
      favoriteTable,
      where: 'id = ?',
      whereArgs: [restaurantId],
    );
  }

  Future<bool> isFavoriteRestaurant(String restaurantId) async {
    final db = await database;
    final count = Sqflite.firstIntValue(await db.rawQuery(
      '''
      SELECT COUNT(*) FROM $favoriteTable WHERE id = ?
      ''',
      [restaurantId],
    ));
    return count == 1;
  }

  Future<RestaurantSummaryEntity> getFavoriteRestaurantSummary(
      String restaurantId) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      favoriteTable,
      where: 'id = ?',
      whereArgs: [restaurantId],
    );

    return results.map((res) => RestaurantSummaryEntity.fromMap(res)).first;
  }

  Future<List<RestaurantSummaryEntity>> getFavoriteRestaurants() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(favoriteTable);
    return List.generate(result.length, (index) {
      return RestaurantSummaryEntity.fromMap(result[index]);
    });
  }
}
