import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/menu_list_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'package:restaurant_app/utils/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('DatabaseHelper', () {
    late DatabaseHelper databaseHelper;
    late String databasePath;

    setUpAll(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });
    setUp(() async {
      databaseHelper = DatabaseHelper();
      databasePath = join(await getDatabasesPath(), DatabaseHelper.dbName);
      await databaseHelper.database;
    });

    tearDownAll(() async {
      final db = await openDatabase(databasePath);
      await db.close();
      await deleteDatabase(databasePath);
    });

    test('Insert and retrieve a favorite restaurant', () async {
      const menusMock = MenuListEntity(
        foods: [
          NameEntity(name: 'Food 1'),
          NameEntity(name: 'Food 2'),
        ],
        drinks: [
          NameEntity(name: 'Drink 1'),
          NameEntity(name: 'Drink 2'),
        ],
      );
      RestaurantDetailEntity testRestaurant = const RestaurantDetailEntity(
        id: 'test_id1',
        name: 'Test Restaurant',
        description: 'Test Description',
        pictureId: 'test_picture_id',
        city: 'Test City',
        rating: 4.5,
        categories: [],
        customerReviews: [],
        menus: menusMock,
      );
      await databaseHelper.insertFavoriteRestaurant(testRestaurant);

      final retrievedRestaurant =
          await databaseHelper.getFavoriteRestaurantSummary(testRestaurant.id);

      expect(retrievedRestaurant.id, testRestaurant.id);
    });

    test('Check if a restaurant is favorited', () async {
      const menus = MenuListEntity(
        foods: [
          NameEntity(name: 'Food 1'),
          NameEntity(name: 'Food 2'),
        ],
        drinks: [
          NameEntity(name: 'Drink 1'),
          NameEntity(name: 'Drink 2'),
        ],
      );
      RestaurantDetailEntity testRestaurant = const RestaurantDetailEntity(
        id: 'test_id2',
        name: 'Test Restaurant',
        description: 'Test Description',
        pictureId: 'test_picture_id',
        city: 'Test City',
        rating: 4.5,
        categories: [],
        customerReviews: [],
        menus: menus,
      );

      await databaseHelper.insertFavoriteRestaurant(testRestaurant);

      final isFavorite =
          await databaseHelper.isFavoriteRestaurant(testRestaurant.id);
      expect(isFavorite, true);
    });
    test('Retrieve all favorite restaurants', () async {
      const menus = MenuListEntity(
        foods: [
          NameEntity(name: 'Food 1'),
          NameEntity(name: 'Food 2'),
        ],
        drinks: [
          NameEntity(name: 'Drink 1'),
          NameEntity(name: 'Drink 2'),
        ],
      );
      RestaurantDetailEntity testRestaurant = const RestaurantDetailEntity(
        id: 'test_id3',
        name: 'Test Restaurant',
        description: 'Test Description',
        pictureId: 'test_picture_id',
        city: 'Test City',
        rating: 4.5,
        categories: [],
        customerReviews: [],
        menus: menus,
      );
      await databaseHelper.insertFavoriteRestaurant(testRestaurant);

      final favoriteRestaurants = await databaseHelper.getFavoriteRestaurants();

      expect(favoriteRestaurants.length, 3);
      expect(favoriteRestaurants[2].id, testRestaurant.id);
    });
    test('Delete a favorite restaurant', () async {
      const menus = MenuListEntity(
        foods: [
          NameEntity(name: 'Food 1'),
          NameEntity(name: 'Food 2'),
        ],
        drinks: [
          NameEntity(name: 'Drink 1'),
          NameEntity(name: 'Drink 2'),
        ],
      );
      RestaurantDetailEntity testRestaurant = const RestaurantDetailEntity(
        id: 'test_id4',
        name: 'Test Restaurant',
        description: 'Test Description',
        pictureId: 'test_picture_id',
        city: 'Test City',
        rating: 4.5,
        categories: [],
        customerReviews: [],
        menus: menus,
      );
      await databaseHelper.insertFavoriteRestaurant(testRestaurant);

      await databaseHelper.deleteFavoriteRestaurant(testRestaurant.id);

      final isFavorite =
          await databaseHelper.isFavoriteRestaurant(testRestaurant.id);
      expect(isFavorite, false);
    });
  });
}
