import 'package:restaurant_app/domain/entities/restaurant_entity.dart';

class RestaurantsEntity {
  final List<RestaurantEntity> restaurants;

  RestaurantsEntity({
    required this.restaurants,
  });

  factory RestaurantsEntity.fromJson(Map<String, dynamic> json) =>
      RestaurantsEntity(
        restaurants: List<RestaurantEntity>.from(
            json["restaurants"].map((x) => RestaurantEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants":
            List<RestaurantEntity>.from(restaurants.map((x) => x.toJson())),
      };
}
