import 'dart:async';

import '../modules/restaurants/domain/entities/restaurant_summary_entity.dart';
import 'database_helper.dart';

class FavoriteRestaurantBloc {
  final _favoriteRestaurantController =
      StreamController<List<RestaurantSummaryEntity>>();
  Stream<List<RestaurantSummaryEntity>> get favoriteRestaurants =>
      _favoriteRestaurantController.stream;

  final _databaseHelper = DatabaseHelper();

  Future<void> fetchFavoriteRestaurants() async {
    final favoriteRestaurants = await _databaseHelper.getFavoriteRestaurants();
    _favoriteRestaurantController.sink.add(favoriteRestaurants);
  }

  Future<void> addFavoriteRestaurant(RestaurantSummaryEntity restaurant) async {
    await _databaseHelper.insertFavoriteRestaurant(restaurant);
    fetchFavoriteRestaurants();
  }

  Future<void> removeFavoriteRestaurant(String restaurantId) async {
    await _databaseHelper.deleteFavoriteRestaurant(restaurantId);
    fetchFavoriteRestaurants();
  }

  Future<bool> checkIfFavoriteRestaurant(String restaurantId) async {
    final isFavorite = await _databaseHelper.isFavoriteRestaurant(restaurantId);
    return isFavorite;
  }

  void dispose() {
    _favoriteRestaurantController.close();
  }
}
