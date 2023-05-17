import 'package:restaurant_app/data/models/restaurant_model.dart';
import 'package:restaurant_app/domain/entities/restaurant_entity.dart';
import 'package:restaurant_app/domain/entities/restaurants_entity.dart';

class RestaurantsModel extends RestaurantsEntity {
  RestaurantsModel.fromJson(Map<String, dynamic> json)
      : super(
          restaurants: List<RestaurantEntity>.from(
            json["restaurants"].map(
              (item) => RestaurantModel.fromJson(json),
            ),
          ),
        );
}
