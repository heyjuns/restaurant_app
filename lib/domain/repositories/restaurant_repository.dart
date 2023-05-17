import 'package:restaurant_app/domain/entities/restaurants_entity.dart';

abstract class RestaurantRepository {
  Future<RestaurantsEntity> getRestaurants();
}
